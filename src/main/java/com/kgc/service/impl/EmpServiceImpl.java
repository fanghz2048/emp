package com.kgc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.entity.Dept;
import com.kgc.entity.Emp;
import com.kgc.entity.EmpExample;
import com.kgc.mapper.DeptMapper;
import com.kgc.mapper.EmpMapper;
import com.kgc.service.EmpService;
import com.kgc.utils.EmpParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpServiceImpl implements EmpService {
    @Autowired
    private EmpMapper empMapper;

    @Autowired
    private DeptMapper deptMapper;

    @Override
    public PageInfo<Emp> getPageInfo(Integer pageIndex, Integer pageSize, EmpParam empParam) {
        //EmpExample对象是一个示例查询,用来控制查询条件
        EmpExample empExample = new EmpExample();
        //设置用empno排序
        empExample.setOrderByClause("empno");
        //查询容器用来放查询条件
        EmpExample.Criteria criteria = empExample.createCriteria();
        //接下来就要写出empparam类,在写查询条件
        if (empParam != null) {
            if (empParam.getEmpname() != null && !empParam.getEmpname().equals("")) {
                criteria.andEmpnameLike("%" + empParam.getEmpname() + "%");
            }
            if (empParam.getDeptno() != null && empParam.getDeptno() != -1) {
                criteria.andDeptnoEqualTo(empParam.getDeptno());
            }
            if (empParam.getMin_sal() != null) {
                criteria.andSalGreaterThanOrEqualTo(empParam.getMax_sal());
            }
            if (empParam.getMax_sal() != null) {
                criteria.andSalLessThanOrEqualTo(empParam.getMax_sal());
            }
        }
        //pagehelper 定义初始页面
        PageHelper.startPage(pageIndex, pageSize);
        //得到list
        List<Emp> empList = empMapper.selectByExample(empExample);
        //将dept装入emp的集合
        if (empList != null && empList.size() > 0) {
            for (Emp emp : empList) {
                Integer deptno = emp.getDeptno();
                Dept dept = deptMapper.selectByPrimaryKey(deptno);
                emp.setDept(dept);
            }
        }
        //pageInfo相当于之前的pageUtil里面存储了所有页面相关的数据
        PageInfo<Emp> info = new PageInfo<>(empList, 5);
        return info;
    }

    @Override
    public boolean addEmp(Emp emp) {
        return empMapper.insert(emp)>0;
    }

    @Override
    public boolean deleteEmp(Integer empno) {
        return empMapper.deleteByPrimaryKey(empno)>0;
    }

    @Override
    public Emp getEmp(Integer empno) {
        return empMapper.selectByPrimaryKey(empno);
    }

    @Override
    public boolean updateEmp(Emp emp) {
        EmpExample example=new EmpExample();
        return empMapper.updateByExampleSelective(emp,example)>0;
    }
}
