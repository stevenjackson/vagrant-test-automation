package models

import anorm._
import anorm.SqlParser._

import play.api.db._
import play.api.Play.current

case class Task(id: Long, label: String)

object Task {

  val task = {
    get[Long]("id") ~
    get[String]("label") map {
      case id~label => Task(id, label)
    }
  }
  
  def all(): List[Task] = DB.withConnection {
    implicit c => SQL("select * from task").as(task *)
  }

  def create(label: String) {
    val sql = "insert into task(label) values ({label})"
    DB.withConnection { 
      implicit c => SQL(sql).on('label -> label).executeUpdate()
    }
  }
 
  def delete(id: Long) {
    val sql = "delete from task where id = {id}"
    DB.withConnection {
      implicit c => SQL(sql).on('id -> id).executeUpdate()
    }
  }
}
