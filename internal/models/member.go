package models

import (
	"time"
)

// Member model
type Member struct {
	No            int    `gorm:"column:mb_no;type:int;primaryKey"`
	Id            string `gorm:"column:mb_id;type:varchar"`
	Password      string
	Name          string
	Nick          string
	NickDate      string `gorm:"column:mb_nick_date;type:date;not null;default:'0000-00-00'"`
	Email         string `gorm:"column:mb_email"`
	Homepage      string
	Level         int8
	Sex           string
	Birth         string
	Tel           string
	Phone         string
	Certify       string
	Adult         int8
	Dupinfo       string
	Zip1          string
	Zip2          string
	Addr1         string
	Addr2         string
	Addr3         string
	AddrJibeon    string
	Signature     string
	Recommend     string
	Point         int
	TodayLogin    time.Time
	LoginIp       string
	Datetime      time.Time
	Ip            string
	LeaveDate     string
	InterceptDate string
	EmailCertify  time.Time
	EmailCertify2 string
	Memo          string
	LostCertify   string
	Mailing       int8
	Sms           int8
	Open          int8
	OpenDate      time.Time
	Profile       string
	MemoCall      string
	MemoCnt       int
	ScrapCnt      int
	Mb1           string
	Mb2           string
	Mb3           string
	Mb4           string
	Mb5           string
	Mb6           string
	Mb7           string
	Mb8           string
	Mb9           string
	Mb10          string
	AsNoti        int
	AsMsg         int8
	AsExp         int
	AsLevel       int
	AsMax         int
	AsChadan      string
}

type AuthMember struct {
	Id    string `gorm:"column:mb_id"`
	Email string `gorm:"column:mb_email"`
}

func (Member) TableName() string {
	return "g5_member"
}
