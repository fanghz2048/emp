package com.kgc.service.impl;

import com.kgc.entity.Dept;
import com.kgc.mapper.DeptMapper;
import com.kgc.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DeptServiceImpl implements DeptService {
    @Autowired
    private DeptMapper deptMapper;
    @Override
    public List<Dept> getDeptList() {
        return deptMapper.selectByExample(null);
    }
}
