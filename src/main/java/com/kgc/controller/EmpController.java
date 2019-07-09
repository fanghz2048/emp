package com.kgc.controller;

import com.github.pagehelper.PageInfo;
import com.kgc.entity.Dept;
import com.kgc.entity.Emp;
import com.kgc.service.DeptService;
import com.kgc.service.EmpService;
import com.kgc.utils.EmpParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/")
public class EmpController {
    @Autowired
    private EmpService empService;
    @Autowired
    private DeptService deptService;

    @RequestMapping("/index")
    public String index(@RequestParam(value = "pageIndex",defaultValue = "1") Integer pageIndex,
                        @RequestParam(value = "pageSize",defaultValue = "3") Integer pageSize,
                        EmpParam empParam,
                        Model model){
        PageInfo<Emp> pageInfo = empService.getPageInfo(pageIndex, pageSize, empParam);
        List<Dept> deptList = deptService.getDeptList();
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("empParam",empParam);
        model.addAttribute("deptList",deptList);
        return "index";
    }
    @RequestMapping(value = "/insert",method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
    public String insert(Model model){
        List<Dept> deptList = deptService.getDeptList();
        model.addAttribute("deptList",deptList);
        return "add";
    }
    @RequestMapping(value = "/insert",method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String insert(Emp emp){
        if(empService.addEmp(emp)){
            return "<script>alert('修改成功');location.href='/index'</script>";
        }else{
            return "<script>alert('修改失败');history.go(-1);</script>";
        }
    }

    //文件异步上传后台方法
    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    @ResponseBody   //返回的是字符串,必须加这个注解.否则返回的字符串就会被解析成路径(此处返回的是json数据,因为本项目有json插件(pom文件中可见))
    public String upload(MultipartFile picfile, HttpServletRequest request) throws IOException {
        //文件名
        String filename = picfile.getOriginalFilename();
        //图片文件的存储路径
        String realPath = request.getSession().getServletContext().getRealPath("/images");
        //创建文件夹
        File parent=new File(realPath);
        if(!parent.exists()){
            parent.mkdirs();//此处提示有返回值,可以忽略
        }
        //在指定文件夹中创建文件对象并命名
        File file=new File(parent,filename);
        //存储文件
        picfile.transferTo(file);
        //返回文件名(用于图片回显)
        return filename;
    }
    @RequestMapping(value = "/delete/{empno}",method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String delete(@PathVariable Integer empno){
        if(empService.deleteEmp(empno)){
            return "<script>alert('删除成功');location.href='/index'</script>";
        }else{
            return "<script>alert('删除失败');history.go(-1);</script>";
        }
    }
    //详情
    @RequestMapping("/detail/{empno}")
    public  String detail(@PathVariable Integer empno,Model model){
        Emp emp = empService.getEmp(empno);
        List<Dept> deptList = deptService.getDeptList();
        for (Dept dept:deptList){
            if (emp.getDeptno()==dept.getDeptno()){
                emp.setDept(dept);
            }
        }
        model.addAttribute("emp",emp);
        return "detail";
    }
    //添加准备
    @RequestMapping(value = "/update/{empno}",method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
    public String update(@PathVariable Integer empno, Model model){
        List<Dept> deptList = deptService.getDeptList();
        Emp emp = empService.getEmp(empno);
        model.addAttribute("deptList",deptList);
        model.addAttribute("emp",emp);
        return "update";
    }
    //添加
    @RequestMapping(value = "/update",method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String update(Emp emp){
        if(empService.updateEmp(emp)){
            return "<script>alert('修改成功');location.href='/index'</script>";
        }else{
            return "<script>alert('修改失败');history.go(-1);</script>";
        }
    }
}
