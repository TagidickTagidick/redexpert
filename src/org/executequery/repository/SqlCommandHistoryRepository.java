/*
 * SqlCommandHistoryRepository.java
 *
 * Copyright (C) 2002-2017 Takis Diakoumis
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 *
 */

package org.executequery.repository;

import java.util.Vector;

/**
 * @author Takis Diakoumis
 */
public interface SqlCommandHistoryRepository extends Repository {

    String REPOSITORY_ID = "sql-command-history";

    void clearSqlCommandHistory(String connection);

    void addSqlCommand(String query, String connection);

    Vector<String> getSqlCommandHistory(String connection);

}











