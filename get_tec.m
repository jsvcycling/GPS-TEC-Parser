function tec = get_tec(filename, hour, minute, lat, lon)
    data = h5read(filename, '/Data/Table Layout');
    
    [~, lat_idx]  = min(abs(data.gdlat - lat));
    [~, lon_idx]  = min(abs(data.glon - lon));
    [~, hour_idx] = min(abs(data.hour - hour));
    [~, min_idx]  = min(abs(data.min - minute));
    
    tec = data.tec(find([data.hour]  == data.hour(hour_idx) &...
                        [data.min]   == data.min(min_idx)   &...
                        [data.gdlat] == data.gdlat(lat_idx) &...
                        [data.glon]  == data.glon(lon_idx)));
end