package com.dota2.pojo;

public class Player {
//数据源-玩家
/*	"account_id":88470,
    "steamid":"76561197960354198",
    "avatar":"https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/80/8012e4aaa96831244fd8015621a2dacbe120de90.jpg",
    "avatarmedium":"https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/80/8012e4aaa96831244fd8015621a2dacbe120de90_medium.jpg",
    "avatarfull":"https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/80/8012e4aaa96831244fd8015621a2dacbe120de90_full.jpg",
    "profileurl":"https://steamcommunity.com/id/misterdurst69/",
    "personaname":"Tzy丶",
    "last_login":null,
    "full_history_time":"2018-11-08T01:14:19.343Z",
    "cheese":0,
    "fh_unavailable":false,
    "loccountrycode":"CN",
    "last_match_time":"2019-04-17T04:42:47.000Z",
    "plus":true,
    "name":"TZY",
    "country_code":"cn",
    "fantasy_role":1,
    "team_id":6020739,
    "team_name":"",
    "team_tag":"",
    "is_locked":false,
    "is_pro":true,
    "locked_until":null*/
	private String account_id;
	private String steamid;
	private String avatarmedium;
	private String avatarfull;
	private String personaname;
	private String last_login;
	private String last_match_time;
	private String name;
	private String full_history_time;
	private String team_name;
	public String getAccount_id() {
		return account_id;
	}
	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}
	public String getSteamid() {
		return steamid;
	}
	public void setSteamid(String steamid) {
		this.steamid = steamid;
	}
	public String getAvatarmedium() {
		return avatarmedium;
	}
	public void setAvatarmedium(String avatarmedium) {
		this.avatarmedium = avatarmedium;
	}
	public String getAvatarfull() {
		return avatarfull;
	}
	public void setAvatarfull(String avatarfull) {
		this.avatarfull = avatarfull;
	}
	public String getPersonaname() {
		return personaname;
	}
	public void setPersonaname(String personaname) {
		this.personaname = personaname;
	}
	public String getLast_login() {
		return last_login;
	}
	public void setLast_login(String last_login) {
		this.last_login = last_login;
	}
	public String getLast_match_time() {
		return last_match_time;
	}
	public void setLast_match_time(String last_match_time) {
		this.last_match_time = last_match_time;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFull_history_time() {
		return full_history_time;
	}
	public void setFull_history_time(String full_history_time) {
		this.full_history_time = full_history_time;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	@Override
	public String toString() {
		return "Player [account_id=" + account_id + ", steamid=" + steamid + ", avatarmedium=" + avatarmedium
				+ ", avatarfull=" + avatarfull + ", personaname=" + personaname + ", last_login=" + last_login
				+ ", last_match_time=" + last_match_time + ", name=" + name + ", full_history_time=" + full_history_time
				+ ", team_name=" + team_name + "]";
	}
}
