%%----------------------------
%%  Copyright (C) 2018 The Center for Solar-Terrestrial Research at
%%                     the New Jersey Institute of Technology
%%
%%  This program is free software: you can redistribute it and/or modify
%%  it under the terms of the GNU General Public License as published by
%%  the Free Software Foundation, either version 3 of the License, or
%%  (at your option) any later version.
%%
%%  This program is distributed in the hope that it will be useful,
%%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%%  GNU General Public License for more details.
%%
%%  You should have received a copy of the GNU General Public License
%%  along with this program.  If not, see <http://www.gnu.org/licenses/>.
%%----------------------------

function tec = get_tec_interp(filename, hour, minute, lat, lon)
    data = h5read(filename, '/Data/Table Layout');
    
    [~, lat_idx]  = min(abs(data.gdlat - lat));
    [~, lon_idx]  = min(abs(data.glon - lon));
    [~, hour_idx] = min(abs(data.hour - hour));
    [~, min_idx]  = min(abs(data.min - minute));
    
    tec = data.tec([data.hour]  == data.hour(hour_idx) &...
                   [data.min]   == data.min(min_idx)   &...
                   [data.gdlat] == data.gdlat(lat_idx) &...
                   [data.glon]  == data.glon(lon_idx));