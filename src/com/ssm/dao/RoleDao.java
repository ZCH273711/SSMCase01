package com.ssm.dao;

import com.ssm.po.Role;

import java.util.List;

public interface RoleDao {
    //获取所有角色信息（角色列表）
    public List<Role> selectRoleList();
}
