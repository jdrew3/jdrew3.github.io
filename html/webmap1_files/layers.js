var wms_layers = [];


        var lyr_OpenStreetMap_0 = new ol.layer.Tile({
            'title': 'OpenStreetMap',
            'type': 'base',
            'opacity': 1.000000,
            
            
            source: new ol.source.XYZ({
    attributions: ' ',
                url: 'http://a.tile.openstreetmap.org/{z}/{x}/{y}.png'
            })
        });
var format_alaska_1 = new ol.format.GeoJSON();
var features_alaska_1 = format_alaska_1.readFeatures(json_alaska_1, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:3857'});
var jsonSource_alaska_1 = new ol.source.Vector({
    attributions: ' ',
});
jsonSource_alaska_1.addFeatures(features_alaska_1);
var lyr_alaska_1 = new ol.layer.Vector({
                declutter: true,
                source:jsonSource_alaska_1, 
                style: style_alaska_1,
                interactive: false,
                title: '<img src="styles/legend/alaska_1.png" /> alaska'
            });
var format_airports_2 = new ol.format.GeoJSON();
var features_airports_2 = format_airports_2.readFeatures(json_airports_2, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:3857'});
var jsonSource_airports_2 = new ol.source.Vector({
    attributions: ' ',
});
jsonSource_airports_2.addFeatures(features_airports_2);
var lyr_airports_2 = new ol.layer.Vector({
                declutter: true,
                source:jsonSource_airports_2, 
                style: style_airports_2,
                interactive: true,
                title: '<img src="styles/legend/airports_2.png" /> airports'
            });

lyr_OpenStreetMap_0.setVisible(true);lyr_alaska_1.setVisible(true);lyr_airports_2.setVisible(true);
var layersList = [lyr_OpenStreetMap_0,lyr_alaska_1,lyr_airports_2];
lyr_alaska_1.set('fieldAliases', {'cat': 'cat', 'NAME': 'NAME', 'AREA_MI': 'AREA_MI', 'small_area': 'small_area', });
lyr_airports_2.set('fieldAliases', {'ID': 'ID', 'fk_region': 'fk_region', 'ELEV': 'ELEV', 'NAME': 'NAME', 'USE': 'USE', });
lyr_alaska_1.set('fieldImages', {'cat': '', 'NAME': '', 'AREA_MI': '', 'small_area': '', });
lyr_airports_2.set('fieldImages', {'ID': '', 'fk_region': '', 'ELEV': '', 'NAME': '', 'USE': '', });
lyr_alaska_1.set('fieldLabels', {'cat': 'no label', 'NAME': 'no label', 'AREA_MI': 'no label', 'small_area': 'no label', });
lyr_airports_2.set('fieldLabels', {'ID': 'inline label', 'fk_region': 'inline label', 'ELEV': 'inline label', 'NAME': 'inline label', 'USE': 'inline label', });
lyr_airports_2.on('precompose', function(evt) {
    evt.context.globalCompositeOperation = 'normal';
});