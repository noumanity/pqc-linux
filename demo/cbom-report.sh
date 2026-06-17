#!/usr/bin/env bash
# cbom-report.sh — Génère des rapports tabulaires à partir d'un fichier CBOM JSON (CycloneDX)
#
# Usage:
#   source cbom-report.sh
#   cbom_certificates  results/ubi10-micro-cbom.json
#   cbom_openssl       results/ubi10-micro-cbom.json
#   cbom_report        results/ubi10-micro-cbom.json   # les deux tableaux

# ── Tableau 1 : Certificats ──────────────────────────────────────────────────
cbom_certificates() {
    local file="${1:?Usage: cbom_certificates <cbom.json>}"

    echo ""
    echo "=== CERTIFICATS ==="
    echo ""

    local count
    count=$(jq '[.components[] | select(.cryptoProperties.assetType == "certificate")] | length' "$file")

    if [[ "$count" -eq 0 ]]; then
        echo "(aucun certificat trouvé)"
        return
    fi

    jq -r '
      # Construire une map bom-ref -> name pour résoudre les refs
      ( [ .components[] ] | map({ (.["bom-ref"]): .name }) | add ) as $names |

      .components[]
      | select(.cryptoProperties.assetType == "certificate")
      | {
          nom:         .name,
          sujet:       .cryptoProperties.certificateProperties.subjectName,
          emetteur:    .cryptoProperties.certificateProperties.issuerName,
          valide_du:   .cryptoProperties.certificateProperties.notValidBefore,
          valide_au:   .cryptoProperties.certificateProperties.notValidAfter,
          format:      .cryptoProperties.certificateProperties.certificateFormat,
          extension:   .cryptoProperties.certificateProperties.certificateExtension,
          algo_sig:    ( $names[.cryptoProperties.certificateProperties.signatureAlgorithmRef] // "n/a" ),
          cle_pub:     ( $names[.cryptoProperties.certificateProperties.subjectPublicKeyRef] // "n/a" ),
          emplacement: ( .evidence.occurrences[0].location // "n/a" )
        }
      | "──────────────────────────────────────────────────────────",
        "Nom           : \(.nom)",
        "Sujet         : \(.sujet)",
        "Émetteur      : \(.emetteur)",
        "Valide du     : \(.valide_du)",
        "Valide au     : \(.valide_au)",
        "Format        : \(.format)  [\(.extension)]",
        "Algo signature: \(.algo_sig)",
        "Clé publique  : \(.cle_pub)",
        "Emplacement   : \(.emplacement)"
    ' "$file"
    echo "──────────────────────────────────────────────────────────"
    echo "Total : $count certificat(s)"
    echo ""
}

# ── Tableau 2 : Configs OpenSSL ──────────────────────────────────────────────
cbom_openssl() {
    local file="${1:?Usage: cbom_openssl <cbom.json>}"

    echo ""
    echo "=== CONFIGURATIONS OPENSSL ==="
    echo ""

    # Les entrées OpenSSL Config Plugin sont des composants dont l'emplacement
    # contient un fichier de configuration openssl (openssl.cnf, openssl.conf, etc.)
    # ou dont le nom/assetType est lié à la configuration.
    local count
    count=$(jq '
      [ .components[]
        | select(
            ( .evidence.occurrences[]?.location | test("openssl\\.cnf|openssl\\.conf|crypto-policies"; "i") )
            or ( .cryptoProperties.assetType == "configuration" )
          )
      ] | length
    ' "$file")

    if [[ "$count" -eq 0 ]]; then
        echo "(aucune configuration OpenSSL trouvée dans ce CBOM)"
        echo ""
        echo "Astuce : pour obtenir les configs OpenSSL, scanner avec le plugin opensslconf :"
        echo "  cbom-theia image -p opensslconf <image>"
        return
    fi

    jq -r '
      .components[]
      | select(
          ( .evidence.occurrences[]?.location | test("openssl\\.cnf|openssl\\.conf|crypto-policies"; "i") )
          or ( .cryptoProperties.assetType == "configuration" )
        )
      | {
          nom:         .name,
          type:        .cryptoProperties.assetType,
          primitive:   ( .cryptoProperties.algorithmProperties.primitive // "n/a" ),
          fonctions:   ( [ .cryptoProperties.algorithmProperties.cryptoFunctions[]? ] | join(", ") ),
          oid:         ( .cryptoProperties.oid // "n/a" ),
          emplacement: ( .evidence.occurrences[0].location // "n/a" )
        }
      | "──────────────────────────────────────────────────────────",
        "Nom           : \(.nom)",
        "Type          : \(.type)",
        "Primitive     : \(.primitive)",
        "Fonctions     : \(.fonctions)",
        "OID           : \(.oid)",
        "Emplacement   : \(.emplacement)"
    ' "$file"
    echo "──────────────────────────────────────────────────────────"
    echo "Total : $count entrée(s) OpenSSL"
    echo ""
}

# ── Rapport complet ──────────────────────────────────────────────────────────
cbom_report() {
    local file="${1:?Usage: cbom_report <cbom.json>}"

    local tool version ts
    tool=$(jq -r '.metadata.tools.services[0].name // "inconnu"' "$file")
    version=$(jq -r '.metadata.tools.services[0].version // "?"' "$file")
    ts=$(jq -r '.metadata.timestamp // "?"' "$file")

    echo ""
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║            RAPPORT CBOM — $tool v$version"
    echo "║  Généré le : $ts"
    echo "╚══════════════════════════════════════════════════════════╝"

    cbom_certificates "$file"
    cbom_openssl "$file"
}
