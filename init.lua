dofile(minetest.get_modpath("player_join").."/config.lua")

------------------ Basic Join/left message ------------------

-- Join Message

function minetest.send_join_message(player_name)
	local privs = minetest.get_player_privs(player_name)
        local staffprivs = privs.admin or privs.moderator or privs.developer or privs.builder 
        if staffprivs then
                        minetest.chat_send_all(minetest.colorize(st_join_color_msg, st_join_prefix_msg).. minetest.colorize(st_join_color_player_name, player_name).. minetest.colorize(st_join_color_msg, st_join_msg))
	else
			minetest.chat_send_all(minetest.colorize(join_color_msg, join_prefix_msg).. minetest.colorize(join_color_player_name, player_name).. minetest.colorize(join_color_msg, join_message))
	end
end


-- Left Message

function minetest.send_leave_message(player_name, timed_out)
	local privs = minetest.get_player_privs(player_name)
        local staffprivs = privs.admin or privs.moderator or privs.developer or privs.builder
        local staff_announcement = minetest.colorize(st_left_color_msg, st_left_prefix_msg).. minetest.colorize(st_left_color_player_name,  player_name).. minetest.colorize(st_left_color_msg, st_left_message)
 	local announcement = minetest.colorize(left_color_msg, left_prefix_msg).. minetest.colorize(left_color_player_name,  player_name).. minetest.colorize(left_color_msg, left_message)
        if staffprivs then
                if timed_out then
 		        staff_announcement = staff_announcement .. " (timed out)"
 		end
 	minetest.chat_send_all(staff_announcement)

        else
 		if timed_out then
 			announcement = announcement .. " (timed out)"
 		end
 	minetest.chat_send_all(announcement)
   end
end
