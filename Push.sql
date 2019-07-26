-- 华为OPPO推送TOKEN表
CREATE TABLE `device_by_hwop` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    `token` varchar(256) NOT NULL COMMENT '华为 oppe厂商 token reg_id',
    `token_idx` varchar(100) NOT NULL COMMENT 'token 做为索引 md5(token + factory)',
    `factory` int(11) NOT NULL DEFAULT '0' COMMENT '1 华为  2 OPPO',
    `agent_id` int(11) NOT NULL COMMENT '代理id',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未删除 1已删除',
    `input_time` datetime NOT NULL,
    `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_f_a` (`factory`,`agent_id`) USING BTREE,
    KEY `idx_f` (`factory`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='华为OPPO推送TOKEN表'

-- 手机厂商设备信息表
CREATE TABLE `device_info` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    `user_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
    `agent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '代理商id',
    `vip` int(11) NOT NULL COMMENT '用户VIPID',
    `device_id` varchar(50) DEFAULT NULL COMMENT '手机设备id',
    `device_name` varchar(50) NOT NULL COMMENT '手机型号',
    `device_brand` varchar(50) NOT NULL COMMENT '手机品牌',
    `token` varchar(256) NOT NULL COMMENT '华为 oppe厂商 token reg_id',
    `token_idx` varchar(100) NOT NULL COMMENT 'token 做为索引 md5(token)',
    `sdk_version` varchar(50) NOT NULL COMMENT '系统版本',
    `device_os` varchar(50) NOT NULL COMMENT '系统',
    `app_version` varchar(50) NOT NULL COMMENT 'app版本',
    `app_vercode` varchar(50) NOT NULL COMMENT 'app版本code',
    `input_time` datetime NOT NULL,
    `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_u_a` (`user_user_id`,`agent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8050 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='手机厂商设备信息表'

-- 消息推送记录表
CREATE TABLE `push_msg` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `content` varchar(100) NOT NULL COMMENT '推送内容',
    `push_code` varchar(50) NOT NULL COMMENT '推送code',
    `msg_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '消息类型 0通知 1透传',
    `push_name` varchar(50) NOT NULL COMMENT '推送名称',
    `factory_tag` varchar(20) NOT NULL COMMENT '手机厂商标签',
    `action_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '动作类型：1 intent  2url 3首页',
    `getto_way` tinyint(1) NOT NULL DEFAULT '0' COMMENT '到达方式  0直达 1push_code api跳转',
    `is_sound` tinyint(1) NOT NULL DEFAULT '0' COMMENT '语音播报 0否 1是',
    `push_os` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '操作系统 1 安卓 2 IOS',
    `address` varchar(255) NOT NULL COMMENT '地址',
    `address_param` varchar(255) NOT NULL COMMENT '地址参数 json格式',
    `return_msg` varchar(255) NOT NULL COMMENT '返回结果',
    `remarks` text NOT NULL COMMENT '备注',
    `push_status` tinyint(1) NOT NULL COMMENT '推送是否成功 0未推送 1已推送',
    `salt` varchar(10) NOT NULL COMMENT '加盐',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未删除 1已删除',
    `input_time` datetime NOT NULL,
    `up_time` datetime NOT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_code` (`push_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1172 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='消息推送记录表'