package com.ggg.bs.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.ggg.bs.common.CResponse;
import com.ggg.bs.model.*;
import com.ggg.bs.services.*;
import com.ggg.bs.util.FileUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.*;

@RestController
@RequestMapping("user")
@Slf4j
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private BugService bugService;
    @Autowired
    private WorkService workService;
    @Autowired
    private VersionService versionService;
    @Autowired
    private CzjlService czjlService;
    @Autowired
    private ProjectService projectService;
    @Autowired
    private TeamService teamService;
    @Autowired
    private FileService fileService;
    @Autowired
    private DemandService demandService;
    @Autowired
    private DemandItemService demandItemService;
    @Autowired
    private TestItemService testItemService;
    @Autowired
    private TestService testService;
    @GetMapping("/getUserList")
    public CResponse getLoginUser() {
        List<User> list = userService.getUserList();
        return CResponse.SUCCESS("成功", list);
    }

    @PostMapping("/login")
    @ResponseBody
    public CResponse login(@RequestBody JSONObject param) {
        String account = (String) param.get("account");
        String pwd = (String) param.get("pwd");
        if (StringUtils.isBlank(account) || StringUtils.isBlank(pwd)) {
            log.info("输入的用户名或密码不可为空" + account + pwd);
            return CResponse.FAIL("输入的用户名或密码不可为空", param);
        }
        User user = userService.getUserByUserAccountAndPassword(account, pwd);
        if (user == null) {
            log.info("输入的用户名或密码错误" + user + account + pwd);
            return CResponse.FAIL("输入的用户名或密码错误！", param);
        }
        log.info("登录成功" + user.toString() + account + pwd);
        return CResponse.SUCCESS("登录成功，欢迎您 " + user.getName(), user);
    }

    @PostMapping("/updatePwd")
    @ResponseBody
    public CResponse updatePwd(@RequestBody JSONObject param) {
        String userId = (String) param.get("userId");
        String oldPwd = (String) param.get("oldPwd");
        String pwd = (String) param.get("pwd");
        User user = userService.getUserById(userId);
        if (user.getPwd().equals(oldPwd)) {
            log.info("修改密码旧密码验证成功" + user.toString() + "  oldPwd:" + oldPwd);
            userService.UpdateUserPwdById(userId, pwd);
            return CResponse.SUCCESS("修改密码成功！", param);
        } else {
            return CResponse.FAIL("请输入正确的原始密码 ", user);
        }
    }

    @PostMapping("/kbInit")
    @ResponseBody
    public CResponse KBDataInit(@RequestBody JSONObject param) {
        String userId = (String) param.get("userId");
        int bugNum = bugService.getBugNumByUserId(userId);
        int doneBugNum = bugService.getDoneNumByUserId(userId);
        int workNum = workService.getWorkNumByUserId(userId);
        int doneWorkNum = workService.getDoneWorkNumByUserId(userId);
        int VersionNum = versionService.getVersionNumByUserId(userId);
        Map<String, Integer> map = new HashMap<>();
        map.put("bugNum", bugNum);
        map.put("doneBugNum", doneBugNum);
        map.put("workNum", workNum);
        map.put("doneWorkNum", doneWorkNum);
        map.put("VersionNum", VersionNum);
        List<Map<String, Object>> projectMap = projectService.kbProject(userId);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("num", map);
        jsonObject.put("projectMap", projectMap);
        return CResponse.SUCCESS("看板页面初始化成功！", jsonObject);
    }

    @PostMapping("/dtTableInit")
    @ResponseBody
    public CResponse dtTableInit(@RequestBody JSONObject param) {
        String userId = (String) param.get("userId");
        int type = Integer.parseInt(param.get("type").toString());
        List<Czjl> list = czjlService.getCzjlByUserId(userId, type);
        return CResponse.SUCCESS("看板页面最近动态表格加载成功！", list);
    }

    @PostMapping("/getCyglTable")
    @ResponseBody
    public CResponse getCyglTable(@RequestBody JSONObject param) {
        String versionId = (String) param.get("versionId");
        List<Map<String, Object>> map = teamService.getCyglTable(versionId);
        return CResponse.SUCCESS("成员管理页面表格加载成功！", map);
    }

    @PostMapping("/cyglDataInit")
    @ResponseBody
    public CResponse cyglDataInit(@RequestBody JSONObject param) {
        String userId = (String) param.get("userId");
        List<Map<String, Object>> map = versionService.getVersionByUserId(userId);
        return CResponse.SUCCESS("成员管理页面数据初始化成功！", map);
    }

    @PostMapping("/getAllVersionByUser")
    @ResponseBody
    public CResponse getAllVersionByUser(@RequestBody JSONObject param) {
        String userId = (String) param.get("userId");
        List<Map<String, Object>> map = versionService.getAllVersionByUser(userId);
        return CResponse.SUCCESS("成员管理页面数据初始化成功！", map);
    }

    @PostMapping("/getAllUser")
    @ResponseBody
    public CResponse getAllUser(@RequestBody JSONObject param) {
        String versionId = (String) param.get("versionId");
        List<Map<String, Object>> map = userService.getAllUser(versionId);
        return CResponse.SUCCESS("获取所有其他员工成功！", map);
    }

    @PostMapping("/getAllUserByPId")
    @ResponseBody
    public CResponse getAllUserByPId(@RequestBody JSONObject param) {
        String pId = (String) param.get("pId");
        List<Map<String, Object>> map = userService.getAllUserByPId(pId);
        return CResponse.SUCCESS("获取当前项目最新迭代内的员工成功！", map);
    }

    @PostMapping("/addUser")
    @ResponseBody
    public CResponse addUser(@RequestBody JSONObject param) {
        String loginUserId = (String) param.get("loginUserId");
        List<Czjl> czjlList = new ArrayList<>();

        String versionId = (String) param.get("versionId");
        List<User> userList = new ArrayList<>();
        List<User> updateUserList = new ArrayList<>();

        for (Object object : (List<User>) param.get("userList")) {
            // 将list中的数据转成json字符串
            String jsonObject = JSON.toJSONString(object);
            //将json转成需要的对象
            User user = JSONObject.parseObject(jsonObject, User.class);
            int a = teamService.selectOneByUV(user.getId(), versionId);
            if (a > 0) {
                updateUserList.add(user);
            } else {
                userList.add(user);
            }
            String str = "给项目【" + versionService.getVersionById(versionId).getName() + "】添加了新成员【" + userService.getUserById(user.getId()).getName() + "】";
            Czjl czjl = new Czjl();
            czjl.setDes(str);
            czjlList.add(czjl);
        }
        int num = 0;
        if (userList.size() > 0) {
            num = teamService.addUser(userList, versionId);
        }
        int num2 = 0;
        if (updateUserList.size() > 0) {
            num2 = updateUserList.size();
            teamService.updateTeamUserSfyx(updateUserList, versionId, 1);
        }
        int number = num + num2;

        czjlService.insertCzjl(loginUserId, czjlList);

        return CResponse.SUCCESS("添加 " + number + " 个员工成功！", number);
    }

    @PostMapping("/deleteUser")
    @ResponseBody
    public CResponse deleteUser(@RequestBody JSONObject param) {
        String loginUserId = (String) param.get("loginUserId");
        List<Czjl> czjlList = new ArrayList<>();
        String versionId = (String) param.get("versionId");
        User user = new User();
        user.setId((String) param.get("userId"));
        List<User> updateUserList = new ArrayList<>();
        updateUserList.add(user);
        int num2 = 0;
        if (updateUserList.size() > 0) {
            num2 = teamService.updateTeamUserSfyx(updateUserList, versionId, 0);
            String str = "从项目【" + versionService.getVersionById(versionId).getName() + "】移除了成员【" + userService.getUserById(user.getId()).getName() + "】";
            Czjl czjl = new Czjl();
            czjl.setDes(str);
            czjlList.add(czjl);
            czjlService.insertCzjl(loginUserId, czjlList);
        }
        return CResponse.SUCCESS("移除 " + num2 + " 个员工成功！", num2);
    }

    @PostMapping("/getDoing")
    @ResponseBody
    public CResponse getDoing(@RequestBody JSONObject param) {
        String versionId = (String) param.get("versionId");
        String userId = (String) param.get("userId");
        List<Map<String, Object>> list = workService.getDoingWorkByUV(userId, versionId);
        return CResponse.SUCCESS("获得正在进行中的任务和BUG成功！", list);
    }

    @PostMapping("/updateWBById")
    @ResponseBody
    public CResponse updateWBById(@RequestBody JSONObject param) {
        List<Map> list = (List<Map>) param.get("list");
        String toUserId = (String) param.get("toUserId");
        String loginUserId = (String) param.get("loginUserId");
        int num = list.size();
        workService.zjDoing(list, loginUserId);
        for (Map map : list) {
            int type = (int) map.get("type");
            String listId = (String) map.get("id");
            if (type == 1) {
                Work work = workService.selectworkbyId(listId);
                workService.addworkbyzj(loginUserId, toUserId, work);
            } else {
                Bug bug = bugService.selectbugbyId(listId);
                bugService.addbugbyzj(loginUserId, toUserId, bug);
            }
        }

        String zjUserId = (String) param.get("zjUserId");

        String name1 = userService.getUserById(zjUserId).getName();
        String name2 = userService.getUserById(toUserId).getName();
        String str = "从【" + name1 + "】转接给【" + name2 + "】" + num + "个任务/BUG";
        Czjl czjl = new Czjl();
        czjl.setDes(str);
        List<Czjl> czjlList = new ArrayList<>();
        czjlList.add(czjl);
        czjlService.insertCzjl(loginUserId, czjlList);

        return CResponse.SUCCESS("转接" + num + "个任务/BUG成功！", num);
    }

    @PostMapping("/xmglData")
    @ResponseBody
    public CResponse xmglData(@RequestBody JSONObject param) {
        String userId = (String) param.get("userId");
        List<Map<String, Object>> list = projectService.xmglData(userId);

        return CResponse.SUCCESS("项目管理页面初始化成功！", list);
    }

    @PostMapping("/addProject")
    @ResponseBody
    public CResponse addProject(@RequestBody JSONObject param) {
        String userId = (String) param.get("userId");
        String pName = (String) param.get("pName");
        String dec = (String) param.get("dec");
        String vName = (String) param.get("vName");
        String team = (String) param.get("team");
        String pid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
        String vid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
        List<String> list = (List<String>) JSONArray.parseArray(team, String.class);
        List<User> userList = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            User user = new User();
            user.setId(list.get(i));
            userList.add(user);
        }
        int num1 = projectService.addProject(pid, userId, pName, dec);
        int num2 = versionService.addVersion(vid, pid, vName, userId);
        int num3 = teamService.addUser(userList, vid);
        String str = "添加新项目【" + pName + "】";
        Czjl czjl = new Czjl();
        czjl.setDes(str);
        List<Czjl> czjlList = new ArrayList<>();
        czjlList.add(czjl);
        czjlService.insertCzjl(userId, czjlList);
        return CResponse.SUCCESS("添加新项目成功！", num1);
    }

    @PostMapping("/projectDetil")
    @ResponseBody
    public CResponse projectDetil(@RequestBody JSONObject param) {
        String pId = (String) param.get("pId");
        List<Map<String, Object>> versionlist = versionService.getVersionByPId(pId);
        List<Map<String, Object>> teamlist = teamService.selectTeamByPid(pId);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("versionlist", versionlist);
        jsonObject.put("teamlist", teamlist);
        return CResponse.SUCCESS("项目详情初始化成功！", jsonObject);
    }

    @PostMapping("/toNewVersion")
    @ResponseBody
    public CResponse toNewVersion(@RequestBody JSONObject param) {
        String pId = (String) param.get("pId");
        List<Map<String, Object>> list = workService.toNewVersion(pId);
        return CResponse.SUCCESS("项目管理页面初始化成功！", list);
    }

    @PostMapping("/addversion")
    @ResponseBody
    public CResponse addversion(@RequestBody JSONObject param) {
        String vid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
        String vname = (String) param.get("vName");
        String pId = (String) param.get("pId");
        String team = (String) param.get("team");
        String createUserId = (String) param.get("createUserId");
        List<String> list = (List<String>) JSONArray.parseArray(team, String.class);
        List<User> userList = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            User user = new User();
            user.setId(list.get(i));
            userList.add(user);
        }
        int num1 = versionService.updateVersionStatus(pId, createUserId);
        int num2 = versionService.addVersion(vid, pId, vname, createUserId);
        int num3 = teamService.addUser(userList, vid);

        String str = "给项目【" + projectService.selectProjectById(pId).getName() + "】添加了新迭代";
        Czjl czjl = new Czjl();
        czjl.setDes(str);
        List<Czjl> czjlList = new ArrayList<>();
        czjlList.add(czjl);
        czjlService.insertCzjl(createUserId, czjlList);
        return CResponse.SUCCESS("新迭代创建成功！", list);
    }

    @PostMapping("/closeP")
    @ResponseBody
    public CResponse closeP(@RequestBody JSONObject param) {
        String userId = (String) param.get("userId");
        String pId = (String) param.get("pId");
        int num = projectService.closeP(userId, pId);
        int num2 = versionService.closeVersionStatus(pId, userId);

        String str = "关闭了项目【" + projectService.selectProjectById(pId).getName() + "】";
        Czjl czjl = new Czjl();
        czjl.setDes(str);
        List<Czjl> czjlList = new ArrayList<>();
        czjlList.add(czjl);
        czjlService.insertCzjl(userId, czjlList);

        return CResponse.SUCCESS("项目管理页面初始化成功！", num);
    }

    @PostMapping("/getrW")
    @ResponseBody
    public CResponse getrW(@RequestBody JSONObject param) {
        String userId = (String) param.get("userId");
        String starttime = (String) param.get("starttime");
        String endtime = (String) param.get("endtime");
        String vId = (String) param.get("vId");
        String pId = (String) param.get("pId");
        String identity = (String) param.get("identity");
        List<Map<String, Object>> map = projectService.selectProjectByUser(userId);
        if (identity.equals("0") || identity.equals("1")) {
            userId = null;
        }
        List<Map<String, Object>> list = workService.getAllWorkByUser(userId, starttime, endtime, vId, pId);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("map", map);
        jsonObject.put("list", list);
        return CResponse.SUCCESS("任务管理页面初始化成功！", jsonObject);
    }
    @PostMapping("/getqx")
    @ResponseBody
    public CResponse getqx(@RequestBody JSONObject param) {
        String userId = (String) param.get("userId");
        String starttime = (String) param.get("starttime");
        String endtime = (String) param.get("endtime");
        String vId = (String) param.get("vId");
        String pId = (String) param.get("pId");
        String identity = (String) param.get("identity");
        List<Map<String, Object>> map = projectService.selectProjectByUser(userId);

            userId = null;

        List<Map<String, Object>> list = bugService.getAllBugByUser(userId, starttime, endtime, vId, pId);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("map", map);
        jsonObject.put("list", list);
        return CResponse.SUCCESS("任务管理页面初始化成功！", jsonObject);
    }

    @PostMapping("/getaddRWV")
    @ResponseBody
    public CResponse getaddRWV(@RequestBody JSONObject param) {
        String userId = (String) param.get("userId");
        List<Map<String, Object>> list = versionService.getVersionByUserId(userId);
        return CResponse.SUCCESS("添加任务弹窗初始化成功！", list);
    }

    @PostMapping("/getaddRWByV")
    @ResponseBody
    public CResponse getaddRWByV(@RequestBody JSONObject param) {
        String vId = (String) param.get("vId");
        List<Map<String, Object>> list = userService.getAllVUser(vId);
        return CResponse.SUCCESS("任务管理页面初始化成功！", list);
    }

    @PostMapping("/addRw")
    @ResponseBody
    public CResponse addRw(@RequestBody JSONObject param) {
        String createUserId = (String) param.get("createUserId");
        String vId = (String) param.get("vId");
        String userId = (String) param.get("selectUser");
        String des = (String) param.get("des");
        int num = workService.addWork(vId, userId, createUserId, des);
        return CResponse.SUCCESS("添加任务成功！", num);
    }
    @PostMapping("/addQx")
    @ResponseBody
    public CResponse addQx(@RequestBody JSONObject param) {
        String createUserId = (String) param.get("createUserId");
        String vId = (String) param.get("vId");
        String userId = (String) param.get("selectUser");
        String des = (String) param.get("des");
        int num = bugService.addBug(vId, userId, createUserId, des);
        return CResponse.SUCCESS("添加缺陷成功！", num);
    }

    @PostMapping("/updateWorkStauts")
    @ResponseBody
    public CResponse updateWorkStauts(@RequestBody JSONObject param) {
        String workId = (String) param.get("workId");
        String userId = (String) param.get("userId");
        int num = workService.updateWorkStauts(workId, "2", userId);
        return CResponse.SUCCESS("更新任务状态成功！", num);
    }
    @PostMapping("/updateBugStauts")
    @ResponseBody
    public CResponse updateBugStauts(@RequestBody JSONObject param) {
        String bugId = (String) param.get("bugId");
        String userId = (String) param.get("userId");
        int num = bugService.updateBugStauts(bugId, "1", userId);
        return CResponse.SUCCESS("更新BUG状态成功！", num);
    }

    @PostMapping("/selectTeamByUV")
    @ResponseBody
    public CResponse selectTeamByUV(@RequestBody JSONObject param) {
        String userId = (String) param.get("userId");
        String vId = (String) param.get("vId");
        List<Map<String, Object>> list = teamService.selectTeamByUV(userId, vId);
        return CResponse.SUCCESS("获取同队内的其他员工成功！", list);
    }

    @PostMapping("/zjrw")
    @ResponseBody
    public CResponse zjrw(@RequestBody JSONObject param) {
        String workId = (String) param.get("workId");
        String toUserId = (String) param.get("toUserId");
        String loginUserId = (String) param.get("loginUserId");
        workService.updateWorkStauts(workId, "3", loginUserId);
        Work work = workService.selectworkbyId(workId);
        int num = workService.addworkbyzj(loginUserId, toUserId, work);
        return CResponse.SUCCESS("转接任务成功！", num);
    }

    @PostMapping("/zjbug")
    @ResponseBody
    public CResponse zjbug(@RequestBody JSONObject param) {
        String bugId = (String) param.get("bugId");
        String toUserId = (String) param.get("toUserId");
        String loginUserId = (String) param.get("loginUserId");
        bugService.updateBugStauts(bugId, "2", loginUserId);

        Bug bug = bugService.selectbugbyId(bugId);
        int num = bugService.addbugbyzj(loginUserId, toUserId, bug);
        return CResponse.SUCCESS("转接BUG成功！", num);
    }

    @PostMapping("/closerw")
    @ResponseBody
    public CResponse closerw(@RequestBody JSONObject param) {
        String workId = (String) param.get("workId");
        String loginUserId = (String) param.get("loginUserId");
        int num = workService.updateWorkStauts(workId, "0", loginUserId);
        return CResponse.SUCCESS("关闭任务成功！", num);
    }
    @PostMapping("/closeQx")
    @ResponseBody
    public CResponse closeQx(@RequestBody JSONObject param) {
        String bugId = (String) param.get("bugId");
        String loginUserId = (String) param.get("loginUserId");
        int num = bugService.updateBugStauts(bugId, "3", loginUserId);
        return CResponse.SUCCESS("关闭任务成功！", num);
    }

    @PostMapping("/getFlieByUV")
    @ResponseBody
    public CResponse getFlieByUV(@RequestBody JSONObject param) {
        String uId = (String) param.get("uId");
        String vId = (String) param.get("vId");
        int type = (Integer) param.get("type");
        List<Map<String, Object>> mapList = fileService.getFlieByUV(uId, vId, type);
        return CResponse.SUCCESS("获取文件成功！", mapList);
    }

    @PostMapping("/getDemandItemBydemandId")
    @ResponseBody
    public CResponse getDemandItemBydemandId(@RequestBody JSONObject param) {
        String demandId = (String) param.get("demandId");
        List<Map<String, Object>> mapList = demandItemService.getDemandItemBydemandId(demandId);
        return CResponse.SUCCESS("获取需求条目成功！", mapList);
    }
    @PostMapping("/updatexqtmstatus")
    @ResponseBody
    public CResponse updatexqtmstatus(@RequestBody JSONObject param) {
        String xqtmId = (String) param.get("xqtmId");
        String userId = (String) param.get("userId");
        int status = Integer.parseInt((String) param.get("status"));
        int num = demandItemService.updateDemandItemStatus(status,xqtmId,userId);
        return CResponse.SUCCESS("修改需求条目状态成功！", num);
    }@PostMapping("/getCsFlieByUV")
    @ResponseBody
    public CResponse getCsFlieByUV(@RequestBody JSONObject param) {
        String uId = (String) param.get("uId");
        String vId = (String) param.get("vId");
        int type = (Integer) param.get("type");
        List<Map<String, Object>> mapList = fileService.getCsFlieByUV(uId, vId, type);
        return CResponse.SUCCESS("获取文件成功！", mapList);
    }

    @PostMapping("/getTestItemByTestId")
    @ResponseBody
    public CResponse getTestItemByTestId(@RequestBody JSONObject param) {
        String testId = (String) param.get("testId");
        List<Map<String, Object>> mapList = testItemService.getTestItemByTestId(testId);
        return CResponse.SUCCESS("获取需求条目成功！", mapList);
    }
    @PostMapping("/updateCstmstatus")
    @ResponseBody
    public CResponse updateCstmstatus(@RequestBody JSONObject param) {
        String cstmId = (String) param.get("cstmId");
        String userId = (String) param.get("userId");
        int status = Integer.parseInt((String) param.get("status"));
        int num = testItemService.updateTestItemStatus(status,cstmId,userId);
        return CResponse.SUCCESS("修改需求条目状态成功！", num);
    }
    @PostMapping("/addxqtm")
    @ResponseBody
    public CResponse addxqtm(@RequestBody JSONObject param) {
        String uId = (String) param.get("uId");
        String vId = (String) param.get("vId");
        String textarea = (String) param.get("textarea");
        String xqtmtitle = (String) param.get("xqtmtitle");
        String demandId = (String) param.get("demandId");
        int num = demandItemService.insertDemandItem(vId, uId, textarea, demandId, xqtmtitle);
        return CResponse.SUCCESS("增加需求条目成功！", num);
    }
    @PostMapping("/addcstm")
    @ResponseBody
    public CResponse addcstm(@RequestBody JSONObject param) {
        String uId = (String) param.get("uId");
        String vId = (String) param.get("vId");
        String textarea = (String) param.get("textarea");
        String cstmtitle = (String) param.get("cstmtitle");
        String testId = (String) param.get("testId");
        int num = testItemService.insertTestItem(vId, uId, textarea, testId, cstmtitle);
        return CResponse.SUCCESS("增加需求条目成功！", num);
    }

    private List fileTypes = new ArrayList() {
        {
            add("xlsx");
            add("xls");
            add("doc");
            add("png");
        }
    };

    @RequestMapping("upload")
    public String uploadFile(@RequestParam("file") MultipartFile file, String vId, String type, String uId) {
        long date = new Date().getTime();
        JSONObject jsonRsult = new JSONObject();
        String filePath = "";
        if (type.equals("1")) {
            filePath = "xq/";
        } else if (type.equals("2")) {
            filePath = "cs/";
        }
        if (file.isEmpty()) {
            jsonRsult.put("code", 201);
            jsonRsult.put("msg", "请选择文件");
            return jsonRsult.toJSONString();
        }
        String originalFilename = file.getOriginalFilename();
        String fileType = originalFilename.substring(originalFilename.lastIndexOf(".") + 1, originalFilename.length());
        if (!fileTypes.contains(fileType)) {
            jsonRsult.put("code", 201);
            jsonRsult.put("msg", "仅支持 .xlsx .xls 文件上传");
            return jsonRsult.toJSONString();
        }
        try {
            byte[] bytes = file.getBytes();
            //要存入本地的地址放到path里面
            Path path = Paths.get(FileUtils.UPLOAD_FOLDER + filePath);
            //如果没有files文件夹，则创建
            if (!Files.isWritable(path)) {
                Files.createDirectories(path);
            }
            String extension = FileUtils.getFileExtension(file);  //获取文件后缀
            FileUtils.getFileByBytes(bytes, FileUtils.UPLOAD_FOLDER + filePath, date + originalFilename);
            String fId = UUID.randomUUID().toString().replace("-", "").toLowerCase();
            File file1 = new File(fId, originalFilename, date + originalFilename,
                    FileUtils.UPLOAD_FOLDER + filePath,
                    uId, Integer.parseInt(type), new Timestamp(date), vId);
            fileService.insertFile(file1);
            if(Integer.parseInt(type)==1){
            demandService.insertDemand(fId, vId);
            }else {
            testService.insertTest(fId, vId);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        log.info("文件上传成功");
        jsonRsult.put("code", 0);
        jsonRsult.put("msg", "上传成功");
        return jsonRsult.toJSONString();
    }

    @GetMapping(value = "/download/fileId/{fileId}")
    public ResponseEntity<ByteArrayResource> downloadFile(@PathVariable("fileId") String fileId, HttpServletRequest request) throws Exception {
        // 这里根据我给定的fileId来下载指定的文件，
        // 如果你想根据其他方式来下载指定文件的话，请自己修改业务逻辑
        // 1. 根据fileId从数据库中获取到指定的文件信息，包括文件名、文件存储地址等等。
        // 1.1 假设我已经获取到了文件信息。
       File file=fileService.getFlieById(fileId);
        String fileName =file.getName();
         String filePath = file.getPath()+file.getOrthername();

        // 2. 解决下载的文件的文件名出现中文乱码
        String userAgent = request.getHeader("User-Agent");
        if (userAgent.contains("MSIE") || userAgent.contains("Trident")) {
            // IE浏览器
            fileName = java.net.URLEncoder.encode(fileName, "UTF-8");
        } else {
            // 非IE浏览器
            fileName = new String(fileName.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1);
        }

        // 3. 下载文件
        byte[] data = Files.readAllBytes(Paths.get(filePath));
        ByteArrayResource resource = new ByteArrayResource(data);

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + fileName)
                .contentType(MediaType.APPLICATION_OCTET_STREAM).contentLength(data.length)
                .body(resource);

    }

}
