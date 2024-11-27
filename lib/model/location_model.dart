// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String type;
  List<Feature> features;
  Query query;

  Welcome({
    required this.type,
    required this.features,
    required this.query,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        type: json["type"],
        features: List<Feature>.from(
            json["features"].map((x) => Feature.fromJson(x))),
        query: Query.fromJson(json["query"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
        "query": query.toJson(),
      };
}

class Feature {
  String type;
  Properties properties;
  Geometry geometry;
  List<double> bbox;

  Feature({
    required this.type,
    required this.properties,
    required this.geometry,
    required this.bbox,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        type: json["type"],
        properties: Properties.fromJson(json["properties"]),
        geometry: Geometry.fromJson(json["geometry"]),
        bbox: List<double>.from(json["bbox"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "properties": properties.toJson(),
        "geometry": geometry.toJson(),
        "bbox": List<dynamic>.from(bbox.map((x) => x)),
      };
}

class Geometry {
  String type;
  List<double> coordinates;

  Geometry({
    required this.type,
    required this.coordinates,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}

class Properties {
  Datasource datasource;
  String country;
  String countryCode;
  String state;
  String county;
  String city;
  String postcode;
  String suburb;
  String street;
  String housenumber;
  double lon;
  double lat;
  String stateCode;
  String resultType;
  String formatted;
  String addressLine1;
  String addressLine2;
  String category;
  Timezone timezone;
  String plusCode;
  String plusCodeShort;
  Rank rank;
  String placeId;

  Properties({
    required this.datasource,
    required this.country,
    required this.countryCode,
    required this.state,
    required this.county,
    required this.city,
    required this.postcode,
    required this.suburb,
    required this.street,
    required this.housenumber,
    required this.lon,
    required this.lat,
    required this.stateCode,
    required this.resultType,
    required this.formatted,
    required this.addressLine1,
    required this.addressLine2,
    required this.category,
    required this.timezone,
    required this.plusCode,
    required this.plusCodeShort,
    required this.rank,
    required this.placeId,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        datasource: Datasource.fromJson(json["datasource"]),
        country: json["country"],
        countryCode: json["country_code"],
        state: json["state"],
        county: json["county"],
        city: json["city"],
        postcode: json["postcode"],
        suburb: json["suburb"],
        street: json["street"],
        housenumber: json["housenumber"],
        lon: json["lon"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
        stateCode: json["state_code"],
        resultType: json["result_type"],
        formatted: json["formatted"],
        addressLine1: json["address_line1"],
        addressLine2: json["address_line2"],
        category: json["category"],
        timezone: Timezone.fromJson(json["timezone"]),
        plusCode: json["plus_code"],
        plusCodeShort: json["plus_code_short"],
        rank: Rank.fromJson(json["rank"]),
        placeId: json["place_id"],
      );

  Map<String, dynamic> toJson() => {
        "datasource": datasource.toJson(),
        "country": country,
        "country_code": countryCode,
        "state": state,
        "county": county,
        "city": city,
        "postcode": postcode,
        "suburb": suburb,
        "street": street,
        "housenumber": housenumber,
        "lon": lon,
        "lat": lat,
        "state_code": stateCode,
        "result_type": resultType,
        "formatted": formatted,
        "address_line1": addressLine1,
        "address_line2": addressLine2,
        "category": category,
        "timezone": timezone.toJson(),
        "plus_code": plusCode,
        "plus_code_short": plusCodeShort,
        "rank": rank.toJson(),
        "place_id": placeId,
      };
}

class Datasource {
  String sourcename;
  String attribution;
  String license;
  String url;

  Datasource({
    required this.sourcename,
    required this.attribution,
    required this.license,
    required this.url,
  });

  factory Datasource.fromJson(Map<String, dynamic> json) => Datasource(
        sourcename: json["sourcename"],
        attribution: json["attribution"],
        license: json["license"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "sourcename": sourcename,
        "attribution": attribution,
        "license": license,
        "url": url,
      };
}

class Rank {
  double importance;
  double popularity;
  int confidence;
  int confidenceCityLevel;
  int confidenceStreetLevel;
  int confidenceBuildingLevel;
  String matchType;

  Rank({
    required this.importance,
    required this.popularity,
    required this.confidence,
    required this.confidenceCityLevel,
    required this.confidenceStreetLevel,
    required this.confidenceBuildingLevel,
    required this.matchType,
  });

  factory Rank.fromJson(Map<String, dynamic> json) => Rank(
        importance: json["importance"]?.toDouble(),
        popularity: json["popularity"]?.toDouble(),
        confidence: json["confidence"],
        confidenceCityLevel: json["confidence_city_level"],
        confidenceStreetLevel: json["confidence_street_level"],
        confidenceBuildingLevel: json["confidence_building_level"],
        matchType: json["match_type"],
      );

  Map<String, dynamic> toJson() => {
        "importance": importance,
        "popularity": popularity,
        "confidence": confidence,
        "confidence_city_level": confidenceCityLevel,
        "confidence_street_level": confidenceStreetLevel,
        "confidence_building_level": confidenceBuildingLevel,
        "match_type": matchType,
      };
}

class Timezone {
  String name;
  String offsetStd;
  int offsetStdSeconds;
  String offsetDst;
  int offsetDstSeconds;
  String abbreviationStd;
  String abbreviationDst;

  Timezone({
    required this.name,
    required this.offsetStd,
    required this.offsetStdSeconds,
    required this.offsetDst,
    required this.offsetDstSeconds,
    required this.abbreviationStd,
    required this.abbreviationDst,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        name: json["name"],
        offsetStd: json["offset_STD"],
        offsetStdSeconds: json["offset_STD_seconds"],
        offsetDst: json["offset_DST"],
        offsetDstSeconds: json["offset_DST_seconds"],
        abbreviationStd: json["abbreviation_STD"],
        abbreviationDst: json["abbreviation_DST"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "offset_STD": offsetStd,
        "offset_STD_seconds": offsetStdSeconds,
        "offset_DST": offsetDst,
        "offset_DST_seconds": offsetDstSeconds,
        "abbreviation_STD": abbreviationStd,
        "abbreviation_DST": abbreviationDst,
      };
}

class Query {
  String text;
  Parsed parsed;

  Query({
    required this.text,
    required this.parsed,
  });

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        text: json["text"],
        parsed: Parsed.fromJson(json["parsed"]),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "parsed": parsed.toJson(),
      };
}

class Parsed {
  String housenumber;
  String street;
  String postcode;
  String district;
  String country;
  String expectedType;

  Parsed({
    required this.housenumber,
    required this.street,
    required this.postcode,
    required this.district,
    required this.country,
    required this.expectedType,
  });

  factory Parsed.fromJson(Map<String, dynamic> json) => Parsed(
        housenumber: json["housenumber"],
        street: json["street"],
        postcode: json["postcode"],
        district: json["district"],
        country: json["country"],
        expectedType: json["expected_type"],
      );

  Map<String, dynamic> toJson() => {
        "housenumber": housenumber,
        "street": street,
        "postcode": postcode,
        "district": district,
        "country": country,
        "expected_type": expectedType,
      };
}
