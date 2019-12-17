class StepsEntity {
	String msg;
	int total;
	int current;
	int code;
	List<StepsData> data;
	int unixtsms;
	dynamic errorcode;

	StepsEntity({this.msg, this.total, this.current, this.code, this.data, this.unixtsms, this.errorcode});

	StepsEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		total = json['total'];
		current = json['current'];
		code = json['code'];
		if (json['data'] != null) {
			data = new List<StepsData>();(json['data'] as List).forEach((v) { data.add(new StepsData.fromJson(v)); });
		}
		unixtsms = json['unixtsms'];
		errorcode = json['errorcode'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['msg'] = this.msg;
		data['total'] = this.total;
		data['current'] = this.current;
		data['code'] = this.code;
		if (this.data != null) {
      data['data'] =  this.data.map((v) => v.toJson()).toList();
    }
		data['unixtsms'] = this.unixtsms;
		data['errorcode'] = this.errorcode;
		return data;
	}
}

class StepsData {
	List<StepsDataSub> subs;
	List<StepsDataValue> values;
	String type;

	StepsData({this.subs, this.values, this.type});

	StepsData.fromJson(Map<String, dynamic> json) {
		if (json['subs'] != null) {
			subs = new List<StepsDataSub>();(json['subs'] as List).forEach((v) { subs.add(new StepsDataSub.fromJson(v)); });
		}
		if (json['values'] != null) {
			values = new List<StepsDataValue>();(json['values'] as List).forEach((v) { values.add(new StepsDataValue.fromJson(v)); });
		}
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.subs != null) {
      data['subs'] =  this.subs.map((v) => v.toJson()).toList();
    }
		if (this.values != null) {
      data['values'] =  this.values.map((v) => v.toJson()).toList();
    }
		data['type'] = this.type;
		return data;
	}
}

class StepsDataSub {
	List<StepsDataSubsValue> values;
	String type;

	StepsDataSub({this.values, this.type});

	StepsDataSub.fromJson(Map<String, dynamic> json) {
		if (json['values'] != null) {
			values = new List<StepsDataSubsValue>();(json['values'] as List).forEach((v) { values.add(new StepsDataSubsValue.fromJson(v)); });
		}
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.values != null) {
      data['values'] =  this.values.map((v) => v.toJson()).toList();
    }
		data['type'] = this.type;
		return data;
	}
}

class StepsDataSubsValue {
	String xFactory;
	int totalStep;
	String name;
	String icon;
	String model;
	StepsDataSubsValuesStep2 step2;
	String category;
	String pair;
	StepsDataSubsValuesStep1 step1;
	List<Null> requires;

	StepsDataSubsValue({this.xFactory, this.totalStep, this.name, this.icon, this.model, this.step2, this.category, this.pair, this.step1, this.requires});

	StepsDataSubsValue.fromJson(Map<String, dynamic> json) {
		xFactory = json['factory'];
		totalStep = json['totalStep'];
		name = json['name'];
		icon = json['icon'];
		model = json['model'];
		step2 = json['step2'] != null ? new StepsDataSubsValuesStep2.fromJson(json['step2']) : null;
		category = json['category'];
		pair = json['pair'];
		step1 = json['step1'] != null ? new StepsDataSubsValuesStep1.fromJson(json['step1']) : null;
		if (json['requires'] != null) {
			requires = new List<Null>();
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['factory'] = this.xFactory;
		data['totalStep'] = this.totalStep;
		data['name'] = this.name;
		data['icon'] = this.icon;
		data['model'] = this.model;
		if (this.step2 != null) {
      data['step2'] = this.step2.toJson();
    }
		data['category'] = this.category;
		data['pair'] = this.pair;
		if (this.step1 != null) {
      data['step1'] = this.step1.toJson();
    }
		if (this.requires != null) {
      data['requires'] =  [];
    }
		return data;
	}
}

class StepsDataSubsValuesStep2 {
	String icon;
	dynamic title1;
	String text;

	StepsDataSubsValuesStep2({this.icon, this.title1, this.text});

	StepsDataSubsValuesStep2.fromJson(Map<String, dynamic> json) {
		icon = json['icon'];
		title1 = json['title1'];
		text = json['text'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['icon'] = this.icon;
		data['title1'] = this.title1;
		data['text'] = this.text;
		return data;
	}
}

class StepsDataSubsValuesStep1 {
	String icon;
	dynamic title1;
	String text;

	StepsDataSubsValuesStep1({this.icon, this.title1, this.text});

	StepsDataSubsValuesStep1.fromJson(Map<String, dynamic> json) {
		icon = json['icon'];
		title1 = json['title1'];
		text = json['text'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['icon'] = this.icon;
		data['title1'] = this.title1;
		data['text'] = this.text;
		return data;
	}
}

class StepsDataValue {
	String xFactory;
	int totalStep;
	String name;
	String icon;
	String model;
	StepsDataValuesStep2 step2;
	String category;
	String pair;
	StepsDataValuesStep1 step1;
	List<Null> requires;

	StepsDataValue({this.xFactory, this.totalStep, this.name, this.icon, this.model, this.step2, this.category, this.pair, this.step1, this.requires});

	StepsDataValue.fromJson(Map<String, dynamic> json) {
		xFactory = json['factory'];
		totalStep = json['totalStep'];
		name = json['name'];
		icon = json['icon'];
		model = json['model'];
		step2 = json['step2'] != null ? new StepsDataValuesStep2.fromJson(json['step2']) : null;
		category = json['category'];
		pair = json['pair'];
		step1 = json['step1'] != null ? new StepsDataValuesStep1.fromJson(json['step1']) : null;
		if (json['requires'] != null) {
			requires = new List<Null>();
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['factory'] = this.xFactory;
		data['totalStep'] = this.totalStep;
		data['name'] = this.name;
		data['icon'] = this.icon;
		data['model'] = this.model;
		if (this.step2 != null) {
      data['step2'] = this.step2.toJson();
    }
		data['category'] = this.category;
		data['pair'] = this.pair;
		if (this.step1 != null) {
      data['step1'] = this.step1.toJson();
    }
		if (this.requires != null) {
      data['requires'] =  [];
    }
		return data;
	}
}

class StepsDataValuesStep2 {
	String icon;
	dynamic title1;
	String text;

	StepsDataValuesStep2({this.icon, this.title1, this.text});

	StepsDataValuesStep2.fromJson(Map<String, dynamic> json) {
		icon = json['icon'];
		title1 = json['title1'];
		text = json['text'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['icon'] = this.icon;
		data['title1'] = this.title1;
		data['text'] = this.text;
		return data;
	}
}

class StepsDataValuesStep1 {
	String icon;
	dynamic title1;
	String text;

	StepsDataValuesStep1({this.icon, this.title1, this.text});

	StepsDataValuesStep1.fromJson(Map<String, dynamic> json) {
		icon = json['icon'];
		title1 = json['title1'];
		text = json['text'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['icon'] = this.icon;
		data['title1'] = this.title1;
		data['text'] = this.text;
		return data;
	}
}
