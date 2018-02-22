%class Cal3_S2Stereo, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Cal3_S2Stereo()
%Cal3_S2Stereo(double fx, double fy, double s, double u0, double v0, double b)
%
%-------Methods-------
%baseline() : returns double
%equals(Cal3_S2Stereo pose, double tol) : returns bool
%fx() : returns double
%fy() : returns double
%principalPoint() : returns gtsam::Point2
%print(string s) : returns void
%px() : returns double
%py() : returns double
%skew() : returns double
%
classdef Cal3_S2Stereo < handle
  properties
    ptr_gtsamCal3_S2Stereo = 0
  end
  methods
    function obj = Cal3_S2Stereo(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(303, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(304);
      elseif nargin == 6 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double') && isa(varargin{5},'double') && isa(varargin{6},'double')
        my_ptr = gtsam_wrapper(305, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6});
      else
        error('Arguments do not match any overload of gtsam.Cal3_S2Stereo constructor');
      end
      obj.ptr_gtsamCal3_S2Stereo = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(306, obj.ptr_gtsamCal3_S2Stereo);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = baseline(this, varargin)
      % BASELINE usage: baseline() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % baseline()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(307, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3_S2Stereo.baseline');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(Cal3_S2Stereo pose, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(Cal3_S2Stereo pose, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Cal3_S2Stereo') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(308, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3_S2Stereo.equals');
      end
    end

    function varargout = fx(this, varargin)
      % FX usage: fx() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % fx()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(309, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3_S2Stereo.fx');
      end
    end

    function varargout = fy(this, varargin)
      % FY usage: fy() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % fy()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(310, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3_S2Stereo.fy');
      end
    end

    function varargout = principalPoint(this, varargin)
      % PRINCIPALPOINT usage: principalPoint() : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % principalPoint()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(311, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3_S2Stereo.principalPoint');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(312, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3_S2Stereo.print');
      end
    end

    function varargout = px(this, varargin)
      % PX usage: px() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % px()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(313, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3_S2Stereo.px');
      end
    end

    function varargout = py(this, varargin)
      % PY usage: py() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % py()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(314, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3_S2Stereo.py');
      end
    end

    function varargout = skew(this, varargin)
      % SKEW usage: skew() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % skew()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(315, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3_S2Stereo.skew');
      end
    end

  end

  methods(Static = true)
  end
end
