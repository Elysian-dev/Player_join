dofile(minetest.get_modpath("player_join") .. "/config.lua")

player_join = {}

local function staffprivs()
	for _, rank in ipairs(ranks_staff) do
		if staffranks.rank_exist(rank) then
			return true
		end
	end
	return false
end

local function has_a_staff_rank(player_name)
	for _, rank in ipairs(ranks_staff) do
		if staffranks.has_rank(player_name, rank)  then
			return true
		end
	end
	return false
end

function minetest.send_join_message(player_name)
	if minetest.get_modpath("staffranks") then
		if staffprivs() then
			if has_a_staff_rank(player_name) then
				minetest.chat_send_all(minetest.colorize(st_join_color_msg, st_join_prefix_msg) ..
				minetest.colorize(st_join_color_player_name, player_name) .. minetest.colorize(st_join_color_msg, join_message))
				return
			end
		end
	end
	minetest.chat_send_all(minetest.colorize(join_color_msg, join_prefix_msg) ..
	minetest.colorize(join_color_player_name, player_name) .. minetest.colorize(join_color_msg, join_message))
end

function minetest.send_leave_message(player_name, timed_out)
	if minetest.get_modpath("staffranks") then
		if staffprivs() then
			if has_a_staff_rank(player_name) then
				announcement = minetest.colorize(st_left_color_msg, st_left_prefix_msg) ..
				minetest.colorize(st_left_color_player_name, player_name) .. minetest.colorize(st_left_color_msg, st_left_message)
			end
		end
	else
		announcement = minetest.colorize(left_color_msg, left_prefix_msg) ..
		minetest.colorize(left_color_player_name, player_name) .. minetest.colorize(left_color_msg, left_message)
	end
	if timed_out then
		announcement = announcement .. " (timed out)"
	end
	minetest.chat_send_all(announcement)
end
