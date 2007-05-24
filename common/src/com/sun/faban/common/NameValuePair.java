/* The contents of this file are subject to the terms
 * of the Common Development and Distribution License
 * (the License). You may not use this file except in
 * compliance with the License.
 *
 * You can obtain a copy of the License at
 * https://faban.dev.java.net/public/CDDLv1.0.html or
 * install_dir/license.txt
 * See the License for the specific language governing
 * permission and limitations under the License.
 *
 * When distributing Covered Code, include this CDDL
 * Header Notice in each file and include the License file
 * at faban/src/legal/CDDLv1.0.txt.
 * If applicable, add the following below the CDDL Header,
 * with the fields enclosed by brackets [] replaced by
 * your own identifying information:
 * "Portions Copyrighted [year] [name of copyright owner]"
 *
 * $Id: NameValuePair.java,v 1.2 2007/05/24 01:06:40 akara Exp $
 *
 * Copyright 2005 Sun Microsystems Inc. All Rights Reserved
 */
package com.sun.faban.common;

import java.io.Serializable;

/**
 * Generic object representing a String name and an Object<T> value.
 *
 * @author Akara Sucharitakul
 */
public class NameValuePair<V> implements Serializable {

    private static final long serialVersionUID = 20070523L;
    
    public String name;
    public V value;
    
    public NameValuePair(String name, V value) {
        this.name = name;
        this.value = value;
    }

    public NameValuePair() {

    }
}
