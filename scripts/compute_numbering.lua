#!/usr/bin/env texlua
-- compute_numbering.lua - calcule la numérotation <sec>.<diapo> pour chaque slide
-- Usage: texlua compute_numbering.lua content1.md content2.md ...
-- Output: une ligne par slide : dir TAB sec_num TAB slide_num
--         (sec_num et slide_num vides si la slide n'a pas de section)
-- Règles :
--   - Une slide sans champ section n'est pas numérotée et ne modifie pas les compteurs.
--   - Un changement de valeur du champ section incrémente sec_num et remet slide_num à 1.
--   - Les variations d'un même content.md partagent le même numéro (on ne lit que la 1re variation).

local script_dir   = (arg[0] or ""):match("(.*[/\\])") or "./"
local texmf_luatex = "/usr/share/texlive/texmf-dist/tex/luatex/markdown/"
package.path = script_dir .. "lib/?.lua;" .. texmf_luatex .. "?.lua;" .. package.path

local tinyyaml = require("markdown-tinyyaml")

local function parse_section(path)
  local fh = io.open(path, "r")
  if not fh then return nil end
  local raw = fh:read("*a"); fh:close()
  raw = raw:gsub("@([./])", "%1"):gsub("\\ ", " ")
  local segments, buf = {}, {}
  for line in (raw .. "\n"):gmatch("([^\n]*)\n") do
    if line == "---" then segments[#segments+1] = table.concat(buf, "\n"); buf = {}
    else buf[#buf+1] = line end
  end
  local first_yaml = segments[2] or ""
  local ok, data = pcall(tinyyaml.parse, first_yaml)
  if not ok or type(data) ~= "table" then return nil end
  local v = (data.content or {})["section"]
  if type(v) == "string" and v ~= "" then return v end
  return nil
end

local sec_num   = 0
local slide_num = 0
local prev_sec  = nil

for i = 1, #arg do
  local path = arg[i]
  local dir  = path:match("(.*[/\\])") or "./"
  local sec  = parse_section(path)

  if sec then
    if sec ~= prev_sec then
      sec_num   = sec_num + 1
      slide_num = 1
      prev_sec  = sec
    else
      slide_num = slide_num + 1
    end
    io.write(dir .. "\t" .. sec_num .. "\t" .. slide_num .. "\n")
  else
    io.write(dir .. "\t\t\n")
  end
end
