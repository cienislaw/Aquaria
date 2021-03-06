-- Copyright (C) 2007, 2010 - Bit-Blot
--
-- This file is part of Aquaria.
--
-- Aquaria is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
-- See the GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

function init(me)
	node_setCursorActivation(me, true)
end
	
function activate(me)
	local n = getNaija()
	
	if getForm() ~= FORM_NORMAL then
		entity_idle(n)
		watch(0.5)
		changeForm(FORM_NORMAL)
		watch(0.5)
	end
	
	entity_swimToNode(n, me)
	entity_watchForPath(n)
	entity_animate(n, "sleep", LOOP_INF)
	overrideZoom(1.25, 2)
	watch(1)
	
	emote(EMOTE_NAIJASADSIGH)
	musicVolume(0.01, 2)
	fadeOut(1)
	watch(1)
	
	entity_heal(getNaija(), 999)
	
	watch(2)
	
	watch(2)

	fadeIn(1)
	watch(1)

	while (not isLeftMouse()) and (not isRightMouse()) do
		watch(FRAME_TIME)
	end
	
	entity_idle(n)
	entity_addVel(n, 0, -200)
	overrideZoom(1, 1)
	musicVolume(1, 1)
	esetv(n, EV_NOINPUTNOVEL, 0)
	watch(1)
	esetv(n, EV_NOINPUTNOVEL, 1)
	overrideZoom(0)	
end

function update(me, dt)
end
