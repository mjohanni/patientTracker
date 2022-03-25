package util;

import com.fasterxml.jackson.databind.ObjectMapper;

import models.Medication;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TextToMap {
    ObjectMapper mapper = new ObjectMapper();
    public List<Medication> textToMap(String listText) throws IOException {
        List<Medication> meds = new ArrayList<>();

        meds = Arrays.asList(mapper.readValue(listText, Medication[].class));

        return meds;
    }
}
