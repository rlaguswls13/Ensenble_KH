package com.kh.ensemble.board.exception;

public class SaveFileException extends RuntimeException {
		public SaveFileException() {
		super("파일 저장 과정중에 예외 발생");
	}
}
