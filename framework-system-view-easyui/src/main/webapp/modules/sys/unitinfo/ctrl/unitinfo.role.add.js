define(function(require) {
	var Config = require('config');
	var Core = require('core/core');

	var Page = require('core/page');

	// 机构添加用户
	var UnitInfoUserAdd = Page.extend(function() {
    this.queryRoleUrl = "system/roleinfo/global";

		// @override
		this.load = function(panel) {
			// 获取父窗口的机构信息
			var unitInfo = this.parent.data;

      $('input[name=roleCode]', panel).combobox({
        url: this.$findUp('queryRoleUrl'),
        loadFilter: function(data) {
          return data.objList ? data.objList : data;
        }
      });

			var data = this.data = $.extend({}, {
				unitCode: unitInfo.unitCode,
				unitName: unitInfo.unitName
			});

			panel.find('form')
				.form('disableValidation')
        .form('load', data)
				.form('focus');
		};

		// @override
		this.submit = function(panel, data, closeCallback) {
			var form = panel.find('form');
			form.form('enableValidation');
			var isValid = form.form('validate');

			if (isValid) {
				form.form('ajax', {
					url: Config.ContextPath+'system/unitrole',
					data: data
				}).then(function(){
          closeCallback(true)
				})
			}

			return false;
		};

		// @override
		this.onClose = function(table, submitted) {
		  if (submitted) {
        table.datagrid('reload');
      }
		};
	});

	return UnitInfoUserAdd;
});
