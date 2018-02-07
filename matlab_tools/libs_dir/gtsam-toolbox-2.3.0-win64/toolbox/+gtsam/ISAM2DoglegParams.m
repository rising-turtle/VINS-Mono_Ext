%class ISAM2DoglegParams, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%ISAM2DoglegParams()
%
%-------Methods-------
%getAdaptationMode() : returns string
%getInitialDelta() : returns double
%getWildfireThreshold() : returns double
%isVerbose() : returns bool
%print(string str) : returns void
%setAdaptationMode(string adaptationMode) : returns void
%setInitialDelta(double initialDelta) : returns void
%setVerbose(bool verbose) : returns void
%setWildfireThreshold(double wildfireThreshold) : returns void
%
classdef ISAM2DoglegParams < handle
  properties
    ptr_gtsamISAM2DoglegParams = 0
  end
  methods
    function obj = ISAM2DoglegParams(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(1116, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(1117);
      else
        error('Arguments do not match any overload of gtsam.ISAM2DoglegParams constructor');
      end
      obj.ptr_gtsamISAM2DoglegParams = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1118, obj.ptr_gtsamISAM2DoglegParams);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = getAdaptationMode(this, varargin)
      % GETADAPTATIONMODE usage: getAdaptationMode() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getAdaptationMode()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1119, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2DoglegParams.getAdaptationMode');
      end
    end

    function varargout = getInitialDelta(this, varargin)
      % GETINITIALDELTA usage: getInitialDelta() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getInitialDelta()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1120, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2DoglegParams.getInitialDelta');
      end
    end

    function varargout = getWildfireThreshold(this, varargin)
      % GETWILDFIRETHRESHOLD usage: getWildfireThreshold() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getWildfireThreshold()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1121, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2DoglegParams.getWildfireThreshold');
      end
    end

    function varargout = isVerbose(this, varargin)
      % ISVERBOSE usage: isVerbose() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % isVerbose()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1122, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2DoglegParams.isVerbose');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string str) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string str)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1123, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2DoglegParams.print');
      end
    end

    function varargout = setAdaptationMode(this, varargin)
      % SETADAPTATIONMODE usage: setAdaptationMode(string adaptationMode) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setAdaptationMode(string adaptationMode)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1124, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2DoglegParams.setAdaptationMode');
      end
    end

    function varargout = setInitialDelta(this, varargin)
      % SETINITIALDELTA usage: setInitialDelta(double initialDelta) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setInitialDelta(double initialDelta)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(1125, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2DoglegParams.setInitialDelta');
      end
    end

    function varargout = setVerbose(this, varargin)
      % SETVERBOSE usage: setVerbose(bool verbose) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setVerbose(bool verbose)
      if length(varargin) == 1 && isa(varargin{1},'logical')
        gtsam_wrapper(1126, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2DoglegParams.setVerbose');
      end
    end

    function varargout = setWildfireThreshold(this, varargin)
      % SETWILDFIRETHRESHOLD usage: setWildfireThreshold(double wildfireThreshold) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setWildfireThreshold(double wildfireThreshold)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(1127, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2DoglegParams.setWildfireThreshold');
      end
    end

  end

  methods(Static = true)
  end
end
