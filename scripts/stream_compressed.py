#!/usr/bin/env python3

import rclpy
from rclpy.node import Node
from cv_bridge import CvBridge
import cv2
from sensor_msgs.msg import Image

class WebcamStreamNode(Node):
    def __init__(self):
        super().__init__('webcam_stream_node')
        self.publisher_ = self.create_publisher(Image, 'webcam_image', 10)
        # Increase the timer frequency to increase fps
        self.timer = self.create_timer(0.05, self.publish_webcam_image)
        self.cap = cv2.VideoCapture(0)  # 0 represents the default camera (you may need to change this depending on your setup)
        self.bridge = CvBridge()

        # Set up video writer with MPEG-2 compression
        fourcc = cv2.VideoWriter_fourcc(*'XVID')
        self.out = cv2.VideoWriter('webcam_output.avi', fourcc, 20.0, (640, 480))

    def publish_webcam_image(self):
        ret, frame = self.cap.read()
        if ret:
            # Resize the frame to lower the resolution
            frame = cv2.resize(frame, (320, 240))

            # Encode frame using OpenCV VideoWriter
            self.out.write(frame)

            # Convert and publish the frame as ROS Image message
            msg = self.bridge.cv2_to_imgmsg(frame, encoding='bgr8')
            self.publisher_.publish(msg)

def main(args=None):
    rclpy.init(args=args)
    node = WebcamStreamNode()
    rclpy.spin(node)

    # Release the video writer and capture objects
    node.out.release()
    node.cap.release()

    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()

