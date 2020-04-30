# CREATE TABLE SPRING_SESSION (
#                                 PRIMARY_ID CHAR(36) NOT NULL,
#                                 SESSION_ID CHAR(36) NOT NULL,
#                                 CREATION_TIME BIGINT NOT NULL,
#                                 LAST_ACCESS_TIME BIGINT NOT NULL,
#                                 MAX_INACTIVE_INTERVAL INT NOT NULL,
#                                 EXPIRY_TIME BIGINT NOT NULL,
#                                 PRINCIPAL_NAME VARCHAR(300),
#                                 CONSTRAINT SPRING_SESSION_PK PRIMARY KEY (PRIMARY_ID)
# ) ENGINE=InnoDB ROW_FORMAT=DYNAMIC;
#
# CREATE UNIQUE INDEX SPRING_SESSION_IX1 ON SPRING_SESSION (SESSION_ID);
# CREATE INDEX SPRING_SESSION_IX2 ON SPRING_SESSION (EXPIRY_TIME);
# CREATE INDEX SPRING_SESSION_IX3 ON SPRING_SESSION (PRINCIPAL_NAME);
#
# CREATE TABLE SPRING_SESSION_ATTRIBUTES (
#                                            SESSION_PRIMARY_ID CHAR(36) NOT NULL,
#                                            ATTRIBUTE_NAME VARCHAR(200) NOT NULL,
#                                            ATTRIBUTE_BYTES BLOB NOT NULL,
#                                            CONSTRAINT SPRING_SESSION_ATTRIBUTES_PK PRIMARY KEY (SESSION_PRIMARY_ID, ATTRIBUTE_NAME),
#                                            CONSTRAINT SPRING_SESSION_ATTRIBUTES_FK FOREIGN KEY (SESSION_PRIMARY_ID) REFERENCES SPRING_SESSION(PRIMARY_ID) ON DELETE CASCADE
# ) ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

CREATE TABLE spring_session (
                                primary_id            CHAR(36) NOT NULL
                                    CONSTRAINT spring_session_pk
                                    PRIMARY KEY,
                                session_id            CHAR(36) NOT NULL,
                                creation_time         BIGINT   NOT NULL,
                                last_access_time      BIGINT   NOT NULL,
                                max_inactive_interval INTEGER  NOT NULL,
                                expiry_time           BIGINT   NOT NULL,
                                principal_name        VARCHAR(300) -- <= here was 100
);

CREATE UNIQUE INDEX spring_session_ix1
    ON spring_session (session_id);

CREATE INDEX spring_session_ix2
    ON spring_session (expiry_time);

CREATE INDEX spring_session_ix3
    ON spring_session (principal_name);


CREATE TABLE spring_session_attributes (
                                           session_primary_id CHAR(36)     NOT NULL
                                               CONSTRAINT spring_session_attributes_fk
                                               REFERENCES spring_session
                                               ON DELETE CASCADE,
                                           attribute_name     VARCHAR(200) NOT NULL,
                                           attribute_bytes    BYTEA        NOT NULL,
                                           CONSTRAINT spring_session_attributes_pk
                                               PRIMARY KEY (session_primary_id, attribute_name)
);