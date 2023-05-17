package com.team5.finalTopic.model.board;

import java.util.List;

public class LikesDTO {
	private Integer mainid;
	private Integer auid;
	private Integer LikeCount;
	private List<String> auidlist;
	private List<Integer> auids;
	
	public List<Integer> getAuids() {
		return auids;
	}

	public void setAuids(List<Integer> auids) {
		this.auids = auids;
	}

	private Integer subid;

	public Integer getSubid() {
		return subid;
	}

	public void setSubid(Integer subid) {
		this.subid = subid;
	}

	public List<String> getAuidlist() {
		return auidlist;
	}

	public void setAuidlist(List<String> auidlist) {
		this.auidlist = auidlist;
	}

	public Integer getLikeCount() {
		return LikeCount;
	}

	public void setLikeCount(Integer likeCount) {
		LikeCount = likeCount;
	}

	public Integer getAuid() {
		return auid;
	}

	public void setAuid(Integer auid) {
		this.auid = auid;
	}

	public Integer getMainid() {
		return mainid;
	}

	public void setMainid(Integer mainid) {
		this.mainid = mainid;
	}
}
