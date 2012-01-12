
#include <cv.h>
#include <highgui.h>


int main (int argc, char** argv)
{
	CvCapture* cam = cvCreateCameraCapture (0);

	IplImage* frame = cvQueryFrame (cam);
	CvSize img_size = cvGetSize (frame);
	IplImage* gray_img = cvCreateImage (img_size, IPL_DEPTH_8U, 1);
	IplImage* edge_img = cvCreateImage (img_size, IPL_DEPTH_8U, 1);	

	int ape = 0;
	int th1 = 50;
	int th2 = 90;
	cvNamedWindow ("win", 0);
	cvCreateTrackbar ("ape", "win", &ape, 2, 0);
	cvSetTrackbarPos ("ape", "win", ape);
	cvCreateTrackbar ("th1", "win", &th1, 512, 0); 
	cvSetTrackbarPos ("th1", "win", th1);
	cvCreateTrackbar ("th2", "win", &th2, 512, 0); 
	cvSetTrackbarPos ("th2", "win", th2);

	while (cvWaitKey (10) != 27) {
		frame = cvQueryFrame (cam);
		cvCvtColor (frame, gray_img, CV_RGB2GRAY);
		cvCanny (gray_img, edge_img, (double) th1, (double) th2, 2*ape + 3);
		cvShowImage ("win", edge_img);
	}

	cvDestroyAllWindows ();
	cvReleaseCapture (&cam);
	return 0;
}





