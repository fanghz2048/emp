package com.kgc.service;

import com.kgc.entity.Dept;
import com.kgc.mapper.DeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


public interface DeptService {

    List<Dept> getDeptList();
}
