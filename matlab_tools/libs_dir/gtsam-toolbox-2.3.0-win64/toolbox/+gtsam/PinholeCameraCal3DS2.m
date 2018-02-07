%class PinholeCameraCal3DS2, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%PinholeCameraCal3DS2()
%PinholeCameraCal3DS2(Pose3 pose)
%PinholeCameraCal3DS2(Pose3 pose, Cal3DS2 K)
%
%-------Methods-------
%backproject(Point2 p, double depth) : returns gtsam::Point3
%calibration() : returns gtsam::Cal3DS2
%dim() : returns size_t
%equals(PinholeCameraCal3DS2 camera, double tol) : returns bool
%localCoordinates(PinholeCameraCal3DS2 T2) : returns Vector
%pose() : returns gtsam::Pose3
%print(string s) : returns void
%project(Point3 point) : returns gtsam::Point2
%projectSafe(Point3 pw) : returns pair< gtsam::Point2, bool >
%range(Point3 point) : returns double
%range(Pose3 point) : returns double
%retract(Vector d) : returns gtsam::PinholeCameraCal3DS2
%
%-------Static Methods-------
%Dim() : returns size_t
%Level(Cal3DS2 K, Pose2 pose, double height) : returns gtsam::PinholeCameraCal3DS2
%Level(Pose2 pose, double height) : returns gtsam::PinholeCameraCal3DS2
%Lookat(Point3 eye, Point3 target, Point3 upVector, Cal3DS2 K) : returns gtsam::PinholeCameraCal3DS2
%project_to_camera(Point3 cameraPoint) : returns gtsam::Point2
%
classdef PinholeCameraCal3DS2 < gtsam.Value
  properties
    ptr_gtsamPinholeCameraCal3DS2 = 0
  end
  methods
    function obj = PinholeCameraCal3DS2(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(359, varargin{2});
        end
        base_ptr = gtsam_wrapper(358, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(360);
      elseif nargin == 1 && isa(varargin{1},'gtsam.Pose3')
        [ my_ptr, base_ptr ] = gtsam_wrapper(361, varargin{1});
      elseif nargin == 2 && isa(varargin{1},'gtsam.Pose3') && isa(varargin{2},'gtsam.Cal3DS2')
        [ my_ptr, base_ptr ] = gtsam_wrapper(362, varargin{1}, varargin{2});
      else
        error('Arguments do not match any overload of gtsam.PinholeCameraCal3DS2 constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamPinholeCameraCal3DS2 = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(363, obj.ptr_gtsamPinholeCameraCal3DS2);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = backproject(this, varargin)
      % BACKPROJECT usage: backproject(Point2 p, double depth) : returns gtsam::Point3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % backproject(Point2 p, double depth)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Point2') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(364, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.backproject');
      end
    end

    function varargout = calibration(this, varargin)
      % CALIBRATION usage: calibration() : returns gtsam::Cal3DS2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % calibration()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(365, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.calibration');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % dim()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(366, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.dim');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(PinholeCameraCal3DS2 camera, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(PinholeCameraCal3DS2 camera, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.PinholeCameraCal3DS2') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(367, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.equals');
      end
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(PinholeCameraCal3DS2 T2) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % localCoordinates(PinholeCameraCal3DS2 T2)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.PinholeCameraCal3DS2')
        varargout{1} = gtsam_wrapper(368, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.localCoordinates');
      end
    end

    function varargout = pose(this, varargin)
      % POSE usage: pose() : returns gtsam::Pose3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % pose()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(369, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.pose');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(370, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.print');
      end
    end

    function varargout = project(this, varargin)
      % PROJECT usage: project(Point3 point) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % project(Point3 point)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(371, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.project');
      end
    end

    function varargout = projectSafe(this, varargin)
      % PROJECTSAFE usage: projectSafe(Point3 pw) : returns pair< gtsam::Point2, bool >
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % projectSafe(Point3 pw)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        [ varargout{1} varargout{2} ] = gtsam_wrapper(372, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.projectSafe');
      end
    end

    function varargout = range(this, varargin)
      % RANGE usage: range(Point3 point),  range(Pose3 point) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % range(Point3 point)
      % range(Pose3 point)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(373, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.Pose3')
        varargout{1} = gtsam_wrapper(374, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.range');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector d) : returns gtsam::PinholeCameraCal3DS2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % retract(Vector d)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(375, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.retract');
      end
    end

  end

  methods(Static = true)
    function varargout = Dim(varargin)
      % DIM usage: Dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % DIM()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(376, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.Dim');
      end
    end

    function varargout = Level(varargin)
      % LEVEL usage: Level(Cal3DS2 K, Pose2 pose, double height),  Level(Pose2 pose, double height) : returns gtsam::PinholeCameraCal3DS2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % LEVEL(Cal3DS2 K, Pose2 pose, double height)
      % LEVEL(Pose2 pose, double height)
      if length(varargin) == 3 && isa(varargin{1},'gtsam.Cal3DS2') && isa(varargin{2},'gtsam.Pose2') && isa(varargin{3},'double')
        varargout{1} = gtsam_wrapper(377, varargin{:});
      elseif length(varargin) == 2 && isa(varargin{1},'gtsam.Pose2') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(378, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.Level');
      end
    end

    function varargout = Lookat(varargin)
      % LOOKAT usage: Lookat(Point3 eye, Point3 target, Point3 upVector, Cal3DS2 K) : returns gtsam::PinholeCameraCal3DS2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % LOOKAT(Point3 eye, Point3 target, Point3 upVector, Cal3DS2 K)
      if length(varargin) == 4 && isa(varargin{1},'gtsam.Point3') && isa(varargin{2},'gtsam.Point3') && isa(varargin{3},'gtsam.Point3') && isa(varargin{4},'gtsam.Cal3DS2')
        varargout{1} = gtsam_wrapper(379, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.Lookat');
      end
    end

    function varargout = Project_to_camera(varargin)
      % PROJECT_TO_CAMERA usage: project_to_camera(Point3 cameraPoint) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % PROJECT_TO_CAMERA(Point3 cameraPoint)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(380, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.Project_to_camera');
      end
    end

  end
end
