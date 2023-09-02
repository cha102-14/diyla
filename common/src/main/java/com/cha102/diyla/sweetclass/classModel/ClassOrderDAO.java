
package com.cha102.diyla.sweetclass.classModel;

import java.util.List;
import java.util.Objects;

public interface ClassOrderDAO {

    public List<ClassOrderDTO> findById(Integer memID);
}
