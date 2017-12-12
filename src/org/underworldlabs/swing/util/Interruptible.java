/*
 * Interruptible.java
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

package org.underworldlabs.swing.util;

/**
 * Defines an interruptible (usually threaded) process.
 *
 * @author Takis Diakoumis
 */
public interface Interruptible {

    /**
     * Sets the process cancel flag as specified.
     */
    public void setCancelled(boolean cancelled);

    /**
     * Indicates thatthis process should be interrupted.
     */
    public void interrupt();

}












