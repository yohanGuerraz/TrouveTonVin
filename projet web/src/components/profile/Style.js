import styled from "styled-components";
import LeftSide from "./LeftSide";
import RightSide from "./RightSide";
import Main from "./Main";
import React from "react";

const Style = (props) => {
  return (
    <Container>
      <Layout>
        <LeftSide />
        <Main />
        <RightSide />
      </Layout>
    </Container>
  );
};

const Container = styled.div`
  padding-top: 5px;
  max-width: 100%;
  font-family: Arial;
`;

const Layout = styled.div`
  display: grid;
  grid-template-areas: "leftside main rightside";
  grid-template-columns: minmax(350px, 6fr) minmax(350, 12fr) minmax(350px, 7fr);
  column-gap: 25px;
  row-gap: 25px;
  /*grid-template-row: auto;*/
  margin: 25px 10px;
  @media (max-width: 768px) {
    display: flex;
    flex-direction: column;
    padding: 0 5px;
  }
`;

export default Style;