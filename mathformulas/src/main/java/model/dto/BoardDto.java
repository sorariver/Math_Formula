package model.dto;
import java.util.*;

public class BoardDto {
	//�������� =�ʵ�=������Ƽ
		private int num;
		private String writer;
		private String email;
		private String subject;
		private String passwd;
		
		private Date regdate;
		private int readcount;
		
		private int ref;//�۱׷�
		private int re_step;//����,��ۼ���
		private int re_level;//��۱���
		private String content;
		private String ip;

	//jsp:useBean �� default �����ڸ� �θ��Ƿ�, �̰ɸ��� private���� �����ϸ� ..�ȵ�.
		public BoardDto(){}//default������

		public int getNum() {
			return num;
		}

		public void setNum(int num) {
			this.num = num;
		}

		public String getWriter() {
			return writer;
		}

		public void setWriter(String writer) {
			this.writer = writer;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getSubject() {
			return subject;
		}

		public void setSubject(String subject) {
			this.subject = subject;
		}

		public String getPasswd() {
			return passwd;
		}

		public void setPasswd(String passwd) {
			this.passwd = passwd;
		}

		public Date getRegdate() {
			return regdate;
		}

		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}

		public int getReadcount() {
			return readcount;
		}

		public void setReadcount(int readcount) {
			this.readcount = readcount;
		}

		public int getRef() {
			return ref;
		}

		public void setRef(int ref) {
			this.ref = ref;
		}

		public int getRe_step() {
			return re_step;
		}

		public void setRe_step(int re_step) {
			this.re_step = re_step;
		}

		public int getRe_level() {
			return re_level;
		}

		public void setRe_level(int re_level) {
			this.re_level = re_level;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}

		public String getIp() {
			return ip;
		}

		public void setIp(String ip) {
			this.ip = ip;
		}

}
