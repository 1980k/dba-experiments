import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;


import processing.opengl.*;


HE_Mesh mesh;
HE_Mesh modifiedMesh;
HE_Mesh modifiedMesh2;
WB_Render render;

float depth = -5000;

void setup(){
    size(1000,1000,OPENGL);
    background(0);
     float[][] values=new float[1024][1024];
  for (int j = 0; j < 1024; j++) {
    for (int i = 0; i < 1024; i++) {
      values[i][j]=10*noise(100.5,1000.5*(j));
    }
  }
 
   
    //Create the grid
    HEC_Grid creator=new HEC_Grid();
    creator.setU(100);// number of cells in U direction
    creator.setV(100);// number of cells in V direction
    creator.setUSize(1000);// size of grid in U direction
    creator.setVSize(1000);// size of grid in V direction
    creator.setWValues(values);// displacement of grid points (W value)
    mesh=new HE_Mesh(creator);
    
    //The easiest way to create a simple modifier is by exporting all vertex coordinates, change them and
    //recreate the mesh with the new coordinates. Writing a full-blown implementation of a HEM_Modifier
    //is best done in Eclipse with full access to the code repository.
    
    //Export the faces and vertices
    float[][] vertices = mesh.getVerticesAsFloat(); // first index = vertex index, second index = 0..2, x,y,z coordinate
    int [][] faces = mesh.getFacesAsInt();// first index = face index, second index = index of vertex belonging to face
     
    //Do something with the vertices, x, y, z
    for(int i=0;i<mesh.numberOfVertices();i++){
     vertices[i][0]*=random(12.2,20)+.2*cos(HALF_PI/100*i+HALF_PI+noise(200.5,200.5)); 
     vertices[i][1]*=random(12.2,20)+.2*sin(HALF_PI/100*i+QUARTER_PI+noise(200.5,200.5));
     vertices[i][2]*=random(10,500)+1.2*cos(HALF_PI/500*i+noise(200.5,200.5));
    }
     
    //Use the exported faces and vertices as source for a HEC_FaceList
    HEC_FromFacelist faceList=new HEC_FromFacelist().setFaces(faces).setVertices(vertices);
    modifiedMesh=new HE_Mesh(faceList);
    
    render=new WB_Render(this);


}

  void draw(){
  
    lights();
    pushMatrix();
    translate(300,300,depth);
    // rotateY(mouseX*1.0f/width*TWO_PI);
    // rotateX(mouseY*1.0f/height*TWO_PI);
    rotateY(frameRate/PI*400);
    rotateX(frameRate/PI*400);
    fill(118,210,239,80);
    //render.drawFaces(mesh);
    stroke(73,129,147,10);
    //render.drawEdges(mesh);
    render.drawFaces(modifiedMesh);
    popMatrix();
    
    pushMatrix();
    translate(300,300,depth);
    rotateY(frameRate/PI*1000);
    rotateX(frameRate/PI*1000);
    fill(255,30);
    //render.drawFaces(mesh);
    stroke(255,10);
    //render.drawEdges(mesh);
    render.drawFaces(modifiedMesh);
    popMatrix();

    pushMatrix();
    translate(300,300,depth);
    rotateY(frameRate/PI*1500);
    rotateX(frameRate/PI*1500);
    fill(0,30);
    //render.drawFaces(mesh);
    stroke(0,10);
    //render.drawEdges(mesh);
    render.drawFaces(modifiedMesh);
    popMatrix();
  }

void keyPressed() {
  if (key == 's') {
    //stop();
    saveFrame();
  }
}



