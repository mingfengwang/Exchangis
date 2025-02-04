-- TODO 这里只适用于第一次安装时。如果是更新的话dss_appconn表不能先删除再插入，因为其他表如dss_workspace_appconn_role关联了appconn_id(不能变)，需要使用update、alter语句更新

delete from `dss_appconn`  where `appconn_name`='exchangis';
INSERT INTO `dss_appconn` (`appconn_name`, `is_user_need_init`, `level`, `if_iframe`, `is_external`, `reference`, `class_name`, `appconn_class_path`, `resource`)
VALUES ('exchangis', 0, 1, 1, 1, NULL, 'com.webank.wedatasphere.exchangis.dss.appconn.ExchangisAppConn', 'DSS_INSTALL_HOME_VAL/dss-appconns/exchangis/lib', '');

select @dss_appconn_exchangisId:=id from `dss_appconn` where `appconn_name` = 'exchangis';

delete from `dss_appconn_instance` where `homepage_uri` like '%exchangis%';
INSERT INTO `dss_appconn_instance` (`appconn_id`, `label`, `url`, `enhance_json`, `homepage_uri`)
VALUES (@dss_appconn_exchangisId, 'DEV', 'http://APPCONN_INSTALL_IP:APPCONN_INSTALL_PORT/', '', 'http://APPCONN_INSTALL_IP:APPCONN_INSTALL_PORT/#/projectManage');
--homepage_uri没改

-- 看appconn组件是要归属于哪个菜单
select @exchangis_menuId:=id from dss_workspace_menu where name = "数据交换";
delete from  `dss_workspace_menu_appconn`  WHERE  title_en='Exchangis';
INSERT INTO `dss_workspace_menu_appconn` (`appconn_id`, `menu_id`, `title_en`, `title_cn`, `desc_en`, `desc_cn`, `labels_en`, `labels_cn`, `is_active`, `access_button_en`, `access_button_cn`, `manual_button_en`, `manual_button_cn`, `manual_button_url`, `icon`, `order`, `create_by`, `create_time`, `last_update_time`, `last_update_user`, `image`)
 VALUES(@dss_appconn_exchangisId,@exchangis_menuId,'Exchangis','Exchangis','Exchangis',''
 ,'exchangis, statement','数据交换,数据源','1','enter Exchangis','进入Exchangis','user manual','用户手册','/manual_url','shujukeshihua-logo',NULL,NULL,NULL,NULL,NULL,'shujukeshihua-icon');

select @dss_exchangis_sqoopId:=id from `dss_workflow_node` where `node_type` = 'linkis.appconn.exchangis.sqoop';
delete from `dss_workflow_node`  where `node_type` like '%exchangis%';
insert into `dss_workflow_node` (`name`, `appconn_name`, `node_type`, `jump_type`, `support_jump`, `submit_to_scheduler`, `enable_copy`, `should_creation_before_node`, `icon_path`)
values('sqoop','exchangis','linkis.appconn.exchangis.sqoop',1,'1','1','0','1','icons/sqoop.icon');

-- 查找节点所属组的id
select @dss_exchangis_sqoopId:=id from `dss_workflow_node` where `node_type` = 'linkis.appconn.exchangis.sqoop';
delete from `dss_workflow_node_to_group` where `node_id`=@dss_exchangis_sqoopId;
INSERT INTO `dss_workflow_node_to_group`(`node_id`,`group_id`) values (@dss_exchangis_sqoopId, 1);

-- 查找sqoop节点所属组的id
delete from `dss_workflow_node_to_ui` where `workflow_node_id`=@dss_exchangis_sqoopId;
INSERT INTO `dss_workflow_node_to_ui`(`workflow_node_id`,`ui_id`) values (@dss_exchangis_sqoopId, 1);
INSERT INTO `dss_workflow_node_to_ui`(`workflow_node_id`,`ui_id`) values (@dss_exchangis_sqoopId, 2);
INSERT INTO `dss_workflow_node_to_ui`(`workflow_node_id`,`ui_id`) values (@dss_exchangis_sqoopId, 3);
INSERT INTO `dss_workflow_node_to_ui`(`workflow_node_id`,`ui_id`) values (@dss_exchangis_sqoopId, 4);
INSERT INTO `dss_workflow_node_to_ui`(`workflow_node_id`,`ui_id`) values (@dss_exchangis_sqoopId, 5);
