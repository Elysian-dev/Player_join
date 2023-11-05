dofile(minetest.get_modpath("player_join").."/config.lua")

-- Join Message

function minetest.send_join_message(player_name)
	if not core.is_singleplayer() then
		minetest.chat_send_all(minetest.colorize(join_color_msg, join_prefix_msg).. minetest.colorize(join_color_player_name, player_name ).. minetest.colorize(join_color_msg, join_message))
		-- minetest.colorize("#005406", "[Server] -> " .. player_name .. " joined the game.")
	end
end

-- Left Message

function minetest.send_leave_message(player_name, timed_out)
	local announcement = minetest.colorize(left_color_msg, left_prefix_msg).. minetest.colorize(left_color_player_name,  player_name).. minetest.colorize(left_color_msg, left_message)
		if timed_out then
			announcement = announcement .. " (timed out)"
		end
	minetest.chat_send_all(announcement)
end

