package com.cha102.diyla.back.controller.diycate;
import com.cha102.diyla.diycatemodel.DiyCateEntity;
import com.cha102.diyla.diycatemodel.DiyCateService;
import com.cha102.diyla.util.PageBean;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
    public DiyCateEntity saveDiyCate(@RequestParam("diyCate") String diyCate,
                                     @RequestParam(value = "image",required = false) MultipartFile imageFile) throws IOException {

        ObjectMapper objectMapper = new ObjectMapper();
        DiyCateEntity diyCateEntity = objectMapper.readValue(diyCate, DiyCateEntity.class);


        if (diyCateEntity.getDiyNo() != 0 && imageFile == null) {
            DiyCateEntity diyCate1 = diyCateService.findById(diyCateEntity.getDiyNo());
            diyCateEntity.setDiyPicture(diyCate1.getDiyPicture());
        }else if (imageFile != null){
            diyCateEntity.setDiyPicture(imageFile.getBytes());
        }
        return diyCateService.saveDiyCate(diyCateEntity);
    }



    @DeleteMapping("/{id}")
    public ResponseEntity deleteDiyCate(@PathVariable int id) {
        diyCateService.deleteDiyCate(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }


    // 瀏覽DIY列表
    @GetMapping("/list")
    public List<DiyCateEntity> getAllDiyCates() {
        return diyCateService.getAllDiyCates();
    }


}
