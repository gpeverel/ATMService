package com.example.atmservice.services;

import com.example.atmservice.models.ATMMachine;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ATMMachineService {
	private List<ATMMachine> atmMachineList = new ArrayList<>();
	private long ID = 0;

	{
		atmMachineList.add(new ATMMachine(++ID, "123asd", "local1", "1234" ));
		atmMachineList.add(new ATMMachine(++ID, "456rty", "locat2", "1234"));
		atmMachineList.add(new ATMMachine(++ID, "234wer", "locat3", "1234"));
	}

	public List<ATMMachine> listATMMachine() {
		return atmMachineList;
	}

	public void saveATMMachine(ATMMachine ATMMachine) {
		ATMMachine.setId(++ID);
		atmMachineList.add(ATMMachine);
	}

	public void deleteATMMachine(Long id) {
		atmMachineList.removeIf(ATMMachine -> ATMMachine.getId().equals(id));
	}

	public ATMMachine getAtmMachineById(Long id) {
		for (ATMMachine machine : atmMachineList) {
			if (machine.getId().equals(id)) {
				return machine;
			}
		}
		return null;
	}
}
