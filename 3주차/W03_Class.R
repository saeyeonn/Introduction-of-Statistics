#**********************************************************************  
#	*주의 사항
#		현재 스크립트 파일은 파일명만 출력되어 있습니다.
#		따라서, 저장된 추출 결과 파일의 경로를 'read.table' 또는 'read.fwf'에 추가하여야 합니다.
#	예) 다운로드 받은 폴더명 : C:\Download
#	  ※ 파일 경로 추가 : "[다운로드 받은 폴더명]\기업활동조사_기업활동조사(제공)_2019_20191201_92007.txt"
# 		read.table("C:\Download\기업활동조사_기업활동조사(제공)_2019_20191201_92007.txt", ~~~
#		또는
#		read.fwf("C:\Download\기업활동조사_기업활동조사(제공)_2019_20191201_92007.txt", ~~~
#
#		R 스크립트는 R 에서 파일 경로만 수정하시면 바로 실행(Ctrl+Alt+R)가능하며,
#		데이터셋 생성 후에 R 의 여러 가지 분석 기능을 사용할 수 있습니다.
#
#**********************************************************************

install.packages("dplyr")
library(dplyr)

setwd('C:/Users/user/Downloads/')

mdis <- read.table("C:/Users/user/Downloads/2020_1%25_인구사항_20220913_02166.csv", header=FALSE, sep=",", colClasses = c("character"
, "numeric", "character", "character", "character", "character", "character"), skip=1, na.string=c("*","**","***","****","*****","******","*******","********","*********","**********","."))

        mdis$V1<- recode_factor(mdis$V1, '1'="남자")
        mdis$V1<- recode_factor(mdis$V1, '2'="여자")
        mdis$V3<- recode_factor(mdis$V3, '01'="가구주(본인)")
        mdis$V3<- recode_factor(mdis$V3, '02'="배우자")
        mdis$V3<- recode_factor(mdis$V3, '03'="자녀")
        mdis$V3<- recode_factor(mdis$V3, '04'="자녀의 배우자")
        mdis$V3<- recode_factor(mdis$V3, '05'="가구주의 부모")
        mdis$V3<- recode_factor(mdis$V3, '06'="배우자의 부모")
        mdis$V3<- recode_factor(mdis$V3, '07'="손주, 손주의 배우자(외손주 포함)")
        mdis$V3<- recode_factor(mdis$V3, '08'="증손주, 증손주의 배우자")
        mdis$V3<- recode_factor(mdis$V3, '09'="조부모")
        mdis$V3<- recode_factor(mdis$V3, '10'="형제자매, 형제자매의 배우자")
        mdis$V3<- recode_factor(mdis$V3, '11'="형제자매의 자녀, 형제자매의 자녀의 배우자")
        mdis$V3<- recode_factor(mdis$V3, '12'="부모의 형제자매, 부모의 형제자매의 배우자")
        mdis$V3<- recode_factor(mdis$V3, '13'="기타 친인척")
        mdis$V3<- recode_factor(mdis$V3, '14'="그 외 같이 사는 사람(고용인, 하숙인 등)")
        mdis$V4<- recode_factor(mdis$V4, '1'="받지않았음(미취학포함)")
        mdis$V4<- recode_factor(mdis$V4, '2'="초등학교")
        mdis$V4<- recode_factor(mdis$V4, '3'="중학교")
        mdis$V4<- recode_factor(mdis$V4, '4'="고등학교")
        mdis$V4<- recode_factor(mdis$V4, '5'="대학교(2,3년제)")
        mdis$V4<- recode_factor(mdis$V4, '6'="대학교(4년제 이상)")
        mdis$V4<- recode_factor(mdis$V4, '7'="대학원 석사 과정")
        mdis$V4<- recode_factor(mdis$V4, '8'="대학원 박사 과정")
        mdis$V5<- recode_factor(mdis$V5, '1'="현재 살고 있는 집")
        mdis$V5<- recode_factor(mdis$V5, '2'="같은 시군구 내 다른 집")
        mdis$V5<- recode_factor(mdis$V5, '3'="다른 시군구")
        mdis$V5<- recode_factor(mdis$V5, '4'="북한 또는 외국")
        mdis$V6<- recode_factor(mdis$V6, '1'="주로 일하였음")
        mdis$V6<- recode_factor(mdis$V6, '2'="틈틈이 일하였음")
        mdis$V6<- recode_factor(mdis$V6, '3'="일시휴직")
        mdis$V6<- recode_factor(mdis$V6, '4'="일하지 않았음")
        mdis$V7<- recode_factor(mdis$V7, '1'="미혼")
        mdis$V7<- recode_factor(mdis$V7, '2'="배우자 있음")
        mdis$V7<- recode_factor(mdis$V7, '3'="사별")
        mdis$V7<- recode_factor(mdis$V7, '4'="이혼")

colnames(mdis) = c("성별코드"
, "만연령", "가구주관계코드", "교육정도코드", "출생지구분코드", "경제활동상태코드", "혼인상태코드")


table1 = table(mdis$성별코드)
table1


barplot(table1)

table2 = table(mdis$성별코드, mdis$교육정도코드)
table2

barplot(table2, col=c("orange","green"),
        main="학력에 따른 성별 인원수",
        xlab="학력", ylab="빈도",
        legend.text=TRUE)

barplot(table2, col=c("orange","green"),
        main="학력에 따른 성별 인원수",
        xlab="학력", ylab="빈도",
        legend.text=TRUE, beside=TRUE)

table3 = table(mdis$교육정도코드)
pie(table3, main="학력수준별 비중", cex=1)

table4=table(mdis$만연령)
barplot(table4, main="연령별 인구",
        xlab="연령", ylab="빈도")
hist(mdis$만연령, main="연령별 인구",
     xlab="연령", ylab="빈도")
hist(mdis$만연령, main="연령별 인구",
     xlab="연령", ylab="빈도",
     breaks=seq(0,90,10))
hist(mdis$만연령, main="연령별 인구",
     xlab="연령", ylab="밀도",
     breaks=seq(0,90,10), probability=TRUE)

boxplot(mdis$만연령)
boxplot(만연령~성별코드,data=mdis, 
        ylab="만나이")

data2=read.csv("C:/Users/user/Downloads/연도별_소비자물가_등락률_2020-2021.csv")


plot(data2$시점, data2$총지수,
     col="blue", type="o", ylim=c(0,6),
     xlab="연도", ylab="지수", pch=1,
     lty=3)
lines(data2$시점, data2$생활물가지수,
      col="red", type="o", pch=3)
legend("topright", c("총지수","생활물가지수"),
       col=c("blue","red"), lty=c(1,1),
       pch=c(1,3))

mean(data2$총지수)
median(data2$총지수)
var(data2$총지수)
sd(data2$총지수)

min(data2$총지수)
max(data2$총지수)
quantile(data2$총지수)
quantile(data2$총지수, probs=c(0.4,0.6))

boxplot(data2$생활물가지수)
quantile(data2$생활물가지수)

