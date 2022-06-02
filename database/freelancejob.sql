USE [master]
GO
/****** Object:  Database [FPTFreelanceJob]    Script Date: 5/30/2022 11:54:52 AM ******/
CREATE DATABASE [FPTFreelanceJob]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FPTFreelanceJob', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FPTFreelanceJob.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FPTFreelanceJob_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FPTFreelanceJob_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FPTFreelanceJob] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FPTFreelanceJob].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FPTFreelanceJob] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET ARITHABORT OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FPTFreelanceJob] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FPTFreelanceJob] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FPTFreelanceJob] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FPTFreelanceJob] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FPTFreelanceJob] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FPTFreelanceJob] SET  MULTI_USER 
GO
ALTER DATABASE [FPTFreelanceJob] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FPTFreelanceJob] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FPTFreelanceJob] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FPTFreelanceJob] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FPTFreelanceJob] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FPTFreelanceJob] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FPTFreelanceJob] SET QUERY_STORE = OFF
GO
USE [FPTFreelanceJob]
GO
/****** Object:  Table [dbo].[tblAdmin]    Script Date: 5/30/2022 11:54:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdmin](
	[id_admin] [int] NOT NULL,
	[type] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblContract]    Script Date: 5/30/2022 11:54:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContract](
	[id_contract] [int] IDENTITY(1,1) NOT NULL,
	[id_freelancer] [int] NOT NULL,
	[id_employer] [int] NOT NULL,
	[id_job] [int] NOT NULL,
	[create_date] [date] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_contract] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployer]    Script Date: 5/30/2022 11:54:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployer](
	[id_employer] [int] NOT NULL,
	[type] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_employer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedback]    Script Date: 5/30/2022 11:54:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedback](
	[id_feedback] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](1000) NULL,
	[rating] [int] NULL,
	[id_freelancer] [int] NOT NULL,
	[id_employer] [int] NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_feedback] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFreelancer]    Script Date: 5/30/2022 11:54:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFreelancer](
	[id_freelancer] [int] NOT NULL,
	[type] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_freelancer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFreelancerSkill]    Script Date: 5/30/2022 11:54:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFreelancerSkill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_freelancer] [int] NOT NULL,
	[id_skill] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblJob]    Script Date: 5/30/2022 11:54:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJob](
	[id_job] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[salary] [float] NOT NULL,
	[description] [nvarchar](255) NOT NULL,
	[duration] [float] NULL,
	[start_date] [date] NULL,
	[id_status] [int] NULL,
	[id_employer] [int] NULL,
	[id_major] [char](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_job] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblJobApplication]    Script Date: 5/30/2022 11:54:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJobApplication](
	[id_application] [int] IDENTITY(1,1) NOT NULL,
	[id_freelancer] [int] NOT NULL,
	[id_job] [int] NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_application] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblJobSkill]    Script Date: 5/30/2022 11:54:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJobSkill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_skill] [int] NULL,
	[id_job] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblJobStatus]    Script Date: 5/30/2022 11:54:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJobStatus](
	[id_status] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMajor]    Script Date: 5/30/2022 11:54:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMajor](
	[id_major] [char](5) NOT NULL,
	[major_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_major] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNotification]    Script Date: 5/30/2022 11:54:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNotification](
	[id_noti] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL,
	[content] [nvarchar](255) NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_noti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSkill]    Script Date: 5/30/2022 11:54:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSkill](
	[id_skill] [int] IDENTITY(1,1) NOT NULL,
	[skill_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_skill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSkillByMajor]    Script Date: 5/30/2022 11:54:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSkillByMajor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_major] [char](5) NOT NULL,
	[id_skill] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 5/30/2022 11:54:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[dob] [date] NULL,
	[address] [nvarchar](255) NULL,
	[bio] [nvarchar](3000) NULL,
	[phone] [char](20) NULL,
	[avatar] [varchar](255) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblAdmin] ([id_admin], [type]) VALUES (8, N'Admin     ')
GO
INSERT [dbo].[tblEmployer] ([id_employer], [type]) VALUES (1, N'Employer  ')
INSERT [dbo].[tblEmployer] ([id_employer], [type]) VALUES (4, N'Employer  ')
INSERT [dbo].[tblEmployer] ([id_employer], [type]) VALUES (6, N'Employer  ')
GO
INSERT [dbo].[tblFreelancer] ([id_freelancer], [type]) VALUES (1, N'Freelancer')
INSERT [dbo].[tblFreelancer] ([id_freelancer], [type]) VALUES (4, N'Freelancer')
INSERT [dbo].[tblFreelancer] ([id_freelancer], [type]) VALUES (6, N'Freelancer')
GO
SET IDENTITY_INSERT [dbo].[tblJob] ON 

INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major]) VALUES (1, N'Thi dùm fe SWE', 500, N'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page', 1, CAST(N'2022-05-30' AS Date), 2, 6, N'SE   ')
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major]) VALUES (6, N'Làm assignment PRJ301', 600, N'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page', 2, CAST(N'2022-05-30' AS Date), 2, 1, N'SE   ')
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major]) VALUES (7, N'Cắt layout', 300, N'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page', 1, CAST(N'2022-06-01' AS Date), 1, 6, N'GD   ')
INSERT [dbo].[tblJob] ([id_job], [title], [salary], [description], [duration], [start_date], [id_status], [id_employer], [id_major]) VALUES (8, N'Làm tiểu luận cuối kì', 1000, N'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page', 5, CAST(N'2022-06-20' AS Date), 2, 4, N'SE   ')
SET IDENTITY_INSERT [dbo].[tblJob] OFF
GO
SET IDENTITY_INSERT [dbo].[tblJobStatus] ON 

INSERT [dbo].[tblJobStatus] ([id_status], [status_name]) VALUES (1, N'Processing')
INSERT [dbo].[tblJobStatus] ([id_status], [status_name]) VALUES (2, N'Accepted')
SET IDENTITY_INSERT [dbo].[tblJobStatus] OFF
GO
INSERT [dbo].[tblMajor] ([id_major], [major_name]) VALUES (N'AI   ', N'Trí tuệ nhân tạo')
INSERT [dbo].[tblMajor] ([id_major], [major_name]) VALUES (N'EN   ', N'Ngôn ngữ Anh')
INSERT [dbo].[tblMajor] ([id_major], [major_name]) VALUES (N'GD   ', N'Thiết kế mỹ thuật số')
INSERT [dbo].[tblMajor] ([id_major], [major_name]) VALUES (N'IA   ', N'An toàn thông tin')
INSERT [dbo].[tblMajor] ([id_major], [major_name]) VALUES (N'IB   ', N'Kinh doanh quốc tế')
INSERT [dbo].[tblMajor] ([id_major], [major_name]) VALUES (N'JP   ', N'Ngôn ngữ Nhật')
INSERT [dbo].[tblMajor] ([id_major], [major_name]) VALUES (N'MC   ', N'Truyền thông đa phương tiện')
INSERT [dbo].[tblMajor] ([id_major], [major_name]) VALUES (N'MK   ', N'Marketing')
INSERT [dbo].[tblMajor] ([id_major], [major_name]) VALUES (N'SE   ', N'Kỹ thuật phần mềm')
GO
SET IDENTITY_INSERT [dbo].[tblSkill] ON 

INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (1, N'Java')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (2, N'C#')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (3, N'C++')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (4, N'Python')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (5, N'SQL')
INSERT [dbo].[tblSkill] ([id_skill], [skill_name]) VALUES (6, N'Photoshop')
SET IDENTITY_INSERT [dbo].[tblSkill] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([id_user], [fullname], [email], [dob], [address], [bio], [phone], [avatar], [status]) VALUES (1, N'Nguyen Thanh Tung', N'tungntse151167@fpt.edu.vn', CAST(N'2001-09-16' AS Date), N'FPT University HCMC', NULL, N'0868649875          ', N'https://lh3.googleusercontent.com/a-/AOh14Gg1FepAR0a7QPecGiCjewAkPlvViFlewVyhWbUJxQ=s96-c', 1)
INSERT [dbo].[tblUser] ([id_user], [fullname], [email], [dob], [address], [bio], [phone], [avatar], [status]) VALUES (4, N'Ngo Xuan Thiep', N'thiepnxse151074@fpt.edu.vn', CAST(N'2001-01-01' AS Date), N'FPT University HCMC', NULL, N'0987654321          ', NULL, 1)
INSERT [dbo].[tblUser] ([id_user], [fullname], [email], [dob], [address], [bio], [phone], [avatar], [status]) VALUES (6, N'Doan Vu Quang Huy', N'huydvqse151224@fpt.edu.vn', NULL, NULL, NULL, NULL, N'https://lh3.googleusercontent.com/a-/AOh14GjA10ilxjaK-ex8IUmwOVHzNmx7yhwDjoZ22GND3Q=s96-c', 1)
INSERT [dbo].[tblUser] ([id_user], [fullname], [email], [dob], [address], [bio], [phone], [avatar], [status]) VALUES (8, N'Nguyen Trong Nguyen Vũ', N'vuntnse151234@fpt.edu.vn', NULL, NULL, NULL, NULL, N'https://lh3.googleusercontent.com/a-/AOh14GhAIUdYRS2050BOcaNbCpCozTLnqpxKlqT1DWm1=s96-c', 1)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblUser__AB6E6164609D1CC2]    Script Date: 5/30/2022 11:54:52 AM ******/
ALTER TABLE [dbo].[tblUser] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAdmin] ADD  DEFAULT ('Admin') FOR [type]
GO
ALTER TABLE [dbo].[tblEmployer] ADD  DEFAULT ('Employer') FOR [type]
GO
ALTER TABLE [dbo].[tblFreelancer] ADD  DEFAULT ('Freelancer') FOR [type]
GO
ALTER TABLE [dbo].[tblAdmin]  WITH CHECK ADD FOREIGN KEY([id_admin])
REFERENCES [dbo].[tblUser] ([id_user])
GO
ALTER TABLE [dbo].[tblContract]  WITH CHECK ADD FOREIGN KEY([id_employer])
REFERENCES [dbo].[tblEmployer] ([id_employer])
GO
ALTER TABLE [dbo].[tblContract]  WITH CHECK ADD FOREIGN KEY([id_freelancer])
REFERENCES [dbo].[tblFreelancer] ([id_freelancer])
GO
ALTER TABLE [dbo].[tblContract]  WITH CHECK ADD FOREIGN KEY([id_job])
REFERENCES [dbo].[tblJob] ([id_job])
GO
ALTER TABLE [dbo].[tblEmployer]  WITH CHECK ADD FOREIGN KEY([id_employer])
REFERENCES [dbo].[tblUser] ([id_user])
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD FOREIGN KEY([id_employer])
REFERENCES [dbo].[tblEmployer] ([id_employer])
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD FOREIGN KEY([id_freelancer])
REFERENCES [dbo].[tblFreelancer] ([id_freelancer])
GO
ALTER TABLE [dbo].[tblFreelancer]  WITH CHECK ADD FOREIGN KEY([id_freelancer])
REFERENCES [dbo].[tblUser] ([id_user])
GO
ALTER TABLE [dbo].[tblFreelancerSkill]  WITH CHECK ADD FOREIGN KEY([id_freelancer])
REFERENCES [dbo].[tblFreelancer] ([id_freelancer])
GO
ALTER TABLE [dbo].[tblFreelancerSkill]  WITH CHECK ADD FOREIGN KEY([id_skill])
REFERENCES [dbo].[tblSkill] ([id_skill])
GO
ALTER TABLE [dbo].[tblJob]  WITH CHECK ADD FOREIGN KEY([id_employer])
REFERENCES [dbo].[tblEmployer] ([id_employer])
GO
ALTER TABLE [dbo].[tblJob]  WITH CHECK ADD FOREIGN KEY([id_major])
REFERENCES [dbo].[tblMajor] ([id_major])
GO
ALTER TABLE [dbo].[tblJob]  WITH CHECK ADD FOREIGN KEY([id_status])
REFERENCES [dbo].[tblJobStatus] ([id_status])
GO
ALTER TABLE [dbo].[tblJobApplication]  WITH CHECK ADD FOREIGN KEY([id_freelancer])
REFERENCES [dbo].[tblFreelancer] ([id_freelancer])
GO
ALTER TABLE [dbo].[tblJobApplication]  WITH CHECK ADD FOREIGN KEY([id_job])
REFERENCES [dbo].[tblJob] ([id_job])
GO
ALTER TABLE [dbo].[tblJobSkill]  WITH CHECK ADD FOREIGN KEY([id_job])
REFERENCES [dbo].[tblJob] ([id_job])
GO
ALTER TABLE [dbo].[tblJobSkill]  WITH CHECK ADD FOREIGN KEY([id_skill])
REFERENCES [dbo].[tblSkill] ([id_skill])
GO
ALTER TABLE [dbo].[tblNotification]  WITH CHECK ADD FOREIGN KEY([id_user])
REFERENCES [dbo].[tblUser] ([id_user])
GO
ALTER TABLE [dbo].[tblSkillByMajor]  WITH CHECK ADD FOREIGN KEY([id_major])
REFERENCES [dbo].[tblMajor] ([id_major])
GO
ALTER TABLE [dbo].[tblSkillByMajor]  WITH CHECK ADD FOREIGN KEY([id_skill])
REFERENCES [dbo].[tblSkill] ([id_skill])
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD CHECK  (([rating]>=(0) OR [rating]<=(5)))
GO
ALTER TABLE [dbo].[tblJob]  WITH CHECK ADD CHECK  (([salary]>(0)))
GO
USE [master]
GO
ALTER DATABASE [FPTFreelanceJob] SET  READ_WRITE 
GO

/*	update code	*/
ALTER TABLE tblJob
ADD create_date DATE DEFAULT GETDATE()
