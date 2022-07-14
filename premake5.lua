newoption({
	trigger     = "count",
	description = "number of git commits to generate",
	value       = "number",
	default     = "10000"
})

newoption({
	trigger     = "message",
	description = "git commit message",
	value       = "string",
	default     = "Cool git commit"
})

local file = io.open("commits.txt", "a")

for i = 1, tonumber(_OPTIONS["count"]), 1 do
	if i > 1 then
		file:write(" ")
	end
	file:write(tostring(i))
	file:flush()
	
	os.execute("git add commits.txt")
	os.executef("git commit \"--message=%s #%d\" -q", _OPTIONS["message"], i)
end

file:close()