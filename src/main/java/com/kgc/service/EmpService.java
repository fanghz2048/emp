package com.kgc.service;

import com.github.pagehelper.PageInfo;
import com.kgc.entity.Emp;
import com.kgc.utils.EmpParam;

import java.util.List;

public interface EmpService {
    //分页查询
    PageInfo<Emp> getPageInfo(Integer pageIndex,Integer pageSize,EmpParam empParam);

    boolean addEmp(Emp emp);

    boolean deleteEmp(Integer empno);

    Emp getEmp(Integer empno);

    boolean updateEmp(Emp emp);
}
