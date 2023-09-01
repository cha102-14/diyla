package com.cha102.diyla.back.controller.diycate;

import com.cha102.diyla.diycatemodel.DiyCateEntity;
import com.cha102.diyla.diycatemodel.DiyCateService;
import com.cha102.diyla.util.PageBean;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/api/diy-cates") //前端串featch api後面的網址(url)
public class DiyCateController {
    private final DiyCateService diyCateService;

    @Autowired
    public DiyCateController(DiyCateService diyCateService) {
        this.diyCateService = diyCateService;
    }

    @GetMapping
    public Page<DiyCateEntity> getAllDiyCates(@RequestParam(defaultValue = "1") Integer page,
                                              @RequestParam(defaultValue = "10") Integer pageSize) {

        PageBean pageBean = new PageBean(page,pageSize);

        return diyCateService.getAllDiyCates(pageBean);
    }

    @GetMapping("/{id}")
    public DiyCateEntity getDiyCateById(@PathVariable int id) {
        return diyCateService.getDiyCateById(id);
    }

    @PostMapping
    public void saveDiyCate(@RequestParam("diycate") String diyCate,
    @RequestParam("image") MultipartFile imageFile) throws IOException {

        ObjectMapper objectMapper = new ObjectMapper();
        DiyCateEntity diyCateEntity = objectMapper.readValue(diyCate, DiyCateEntity.class);

        diyCateEntity.setDiyPicture(imageFile.getBytes());
        diyCateService.saveDiyCate(diyCateEntity);
    }



    @DeleteMapping("/{id}")
    public void deleteDiyCate(@PathVariable int id) {
        diyCateService.deleteDiyCate(id);
    }

    // 瀏覽DIY列表
    @GetMapping("/list")
    public List<DiyCateEntity> getAllDiyCates() {
        return diyCateService.getAllDiyCates();
    }

}
