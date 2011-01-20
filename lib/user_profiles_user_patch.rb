# User Profiles plugin for Redmine
# Copyright (C) 2010  Haruyuki Iida
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

class UserPreference < ActiveRecord::Base
  has_one :user_profile, :dependent => :destroy, :class_name => 'UserProfile'

  def prof
    user_profile = UserProfile.find_by_user_id(user.id)
    return nil unless user_profile
    user_profile.content
  end

  def prof=(content)
    user_profile = UserProfile.find_or_create_by_user_id(user.id)
    user_profile.content = content
    user_profile.save!
  end
end
