package org.han.web;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.han.service.BbsService;
import org.han.util.PageMaker;
import org.han.vo.BbsVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/hanBbs/*")
public class BbsController {
	
	private static final Logger logger = LoggerFactory
			.getLogger(BbsController.class);
	
	@Inject
	BbsService service;
	
	@Inject
	BbsVO vo;
	
	//view create page
		@RequestMapping(value = "/create")
		public String create() {
			return "hanBbs/create";

		}

		//insert sumit data 
		@RequestMapping(value = "/insert")
		public String insert(@ModelAttribute BbsVO vo) {
			service.create(vo);
			return "redirect:list";
			//insert후 redirect로 페이지 갱신
		}
		
		

		@RequestMapping(value="/list")
		public void viewPageList(PageMaker maker, Model model){
			
			//addAttribute deliver "list" to view page
			try {
				model.addAttribute("list",service.listPage(maker));
			} catch (Exception e) {
				model.addAttribute("erroeMessage","해당 검색 결과가 없습니다.");	
				maker.setKeyword("");
			}
			model.addAttribute("maker",maker);
		
		}
		
		@RequestMapping(value="/read")
		public void readPage(@ModelAttribute BbsVO vo, Model model){
			model.addAttribute("bbs",service.read(vo));
//			없는 페이지 오류 처리해야 함 
			
		}
	
		@RequestMapping(value="/delete")
		public String deletePage(@RequestParam int bno){
			service.delete(bno);
//			int nextBno= bbs.getBno()-1;
			return "redirect:list?bno="+1;
		}
		
		@RequestMapping(value="/modify")
		public String modifyPage(@ModelAttribute BbsVO vo, Model model){
			model.addAttribute("bbs",service.read(vo));
			
			return "hanBbs/update";
		}

		@RequestMapping(value="/update")
		public String updatePage(@ModelAttribute BbsVO vo, Model model){
			logger.info(vo.toString());
			service.update(vo);
		
			return "redirect:read?bno="+vo.getBno();
		}
		
		
//		==================file Upload===============
		

		
		
}
