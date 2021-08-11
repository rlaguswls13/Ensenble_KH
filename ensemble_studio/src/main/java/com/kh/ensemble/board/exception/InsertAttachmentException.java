package com.kh.ensemble.board.exception;

public class InsertAttachmentException extends RuntimeException {
	public InsertAttachmentException() {
		super("파일 정보를 삽입하는 과정에서 문제 발생");
	}
}
