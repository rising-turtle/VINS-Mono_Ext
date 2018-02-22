%class SimpleCamera, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%SimpleCamera()
%SimpleCamera(Pose3 pose)
%SimpleCamera(Pose3 pose, Cal3_S2 K)
%
%-------Methods-------
%backproject(Point2 p, double depth) : returns gtsam::Point3
%calibration() : returns gtsam::Cal3_S2
%dim() : returns size_t
%equals(SimpleCamera camera, double tol) : returns bool
%localCoordinates(SimpleCamera T2) : returns Vector
%pose() : returns gtsam::Pose3
%print(string s) : returns void
%project(Point3 point) : returns gtsam::Point2
%projectSafe(Point3 pw) : returns pair< gtsam::Point2, bool >
%range(Point3 point) : returns double
%range(Pose3 point) : returns double
%retract(Vector d) : returns gtsam::SimpleCamera
%
%-------Static Methods-------
%Dim() : returns size_t
%Level(Cal3_S2 K, Pose2 pose, double height) : returns gtsam::SimpleCamera
%Level(Pose2 pose, double height) : returns gtsam::SimpleCamera
%Lookat(Point3 eye, Point3 target, Point3 upVector, Cal3_S2 K) : returns gtsam::SimpleCamera
%project_to_camera(Point3 cameraPoint) : returns gtsam::Point2
%
classdef SimpleCamera < gtsam.Value
  properties
    ptr_gtsamSimpleCamera = 0
  end
  methods
    function obj = SimpleCamera(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(336, varargin{2});
        end
        base_ptr = gtsam_wrapper(335, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(337);
      elseif nargin == 1 && isa(varargin{1},'gtsam.Pose3')
        [ my_ptr, base_ptr ] = gtsam_wrapper(338, varargin{1});
      elseif nargin == 2 && isa(varargin{1},'gtsam.Pose3') && isa(varargin{2},'gtsam.Cal3_S2')
        [ my_ptr, base_ptr ] = gtsam_wrapper(339, varargin{1}, varargin{2});
      else
        error('Arguments do not match any overload of gtsam.SimpleCamera constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamSimpleCamera = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(340, obj.ptr_gtsamSimpleCamera);
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
        varargout{1} = gtsam_wrapper(341, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimpleCamera.backproject');
      end
    end

    function varargout = calibration(this, varargin)
      % CALIBRATION usage: calibration() : returns gtsam::Cal3_S2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % calibration()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(342, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimpleCamera.calibration');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % dim()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(343, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimpleCamera.dim');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(SimpleCamera camera, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(SimpleCamera camera, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.SimpleCamera') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(344, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimpleCamera.equals');
      end
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(SimpleCamera T2) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % localCoordinates(SimpleCamera T2)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.SimpleCamera')
        varargout{1} = gtsam_wrapper(345, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimpleCamera.localCoordinates');
      end
    end

    function varargout = pose(this, varargin)
      % POSE usage: pose() : returns gtsam::Pose3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % pose()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(346, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimpleCamera.pose');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(347, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimpleCamera.print');
      end
    end

    function varargout = project(this, varargin)
      % PROJECT usage: project(Point3 point) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % project(Point3 point)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(348, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimpleCamera.project');
      end
    end

    function varargout = projectSafe(this, varargin)
      % PROJECTSAFE usage: projectSafe(Point3 pw) : returns pair< gtsam::Point2, bool >
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % projectSafe(Point3 pw)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        [ varargout{1} varargout{2} ] = gtsam_wrapper(349, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimpleCamera.projectSafe');
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
        varargout{1} = gtsam_wrapper(350, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.Pose3')
        varargout{1} = gtsam_wrapper(351, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimpleCamera.range');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector d) : returns gtsam::SimpleCamera
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % retract(Vector d)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(352, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimpleCamera.retract');
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
        varargout{1} = gtsam_wrapper(353, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimpleCamera.Dim');
      end
    end

    function varargout = Level(varargin)
      % LEVEL usage: Level(Cal3_S2 K, Pose2 pose, double height),  Level(Pose2 pose, double height) : returns gtsam::SimpleCamera
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % LEVEL(Cal3_S2 K, Pose2 pose, double height)
      % LEVEL(Pose2 pose, double height)
      if length(varargin) == 3 && isa(varargin{1},'gtsam.Cal3_S2') && isa(varargin{2},'gtsam.Pose2') && isa(varargin{3},'double')
        varargout{1} = gtsam_wrapper(354, varargin{:});
      elseif length(varargin) == 2 && isa(varargin{1},'gtsam.Pose2') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(355, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimpleCamera.Level');
      end
    end

    function varargout = Lookat(varargin)
      % LOOKAT usage: Lookat(Point3 eye, Point3 target, Point3 upVector, Cal3_S2 K) : returns gtsam::SimpleCamera
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % LOOKAT(Point3 eye, Point3 target, Point3 upVector, Cal3_S2 K)
      if length(varargin) == 4 && isa(varargin{1},'gtsam.Point3') && isa(varargin{2},'gtsam.Point3') && isa(varargin{3},'gtsam.Point3') && isa(varargin{4},'gtsam.Cal3_S2')
        varargout{1} = gtsam_wrapper(356, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimpleCamera.Lookat');
      end
    end

    function varargout = Project_to_camera(varargin)
      % PROJECT_TO_CAMERA usage: project_to_camera(Point3 cameraPoint) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % PROJECT_TO_CAMERA(Point3 cameraPoint)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(357, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimpleCamera.Project_to_camera');
      end
    end

  end
end
