%class ISAM2Result, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%ISAM2Result()
%
%-------Methods-------
%getCliques() : returns size_t
%getVariablesReeliminated() : returns size_t
%getVariablesRelinearized() : returns size_t
%print(string str) : returns void
%
classdef ISAM2Result < handle
  properties
    ptr_gtsamISAM2Result = 0
  end
  methods
    function obj = ISAM2Result(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(1170, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(1171);
      else
        error('Arguments do not match any overload of gtsam.ISAM2Result constructor');
      end
      obj.ptr_gtsamISAM2Result = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1172, obj.ptr_gtsamISAM2Result);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = getCliques(this, varargin)
      % GETCLIQUES usage: getCliques() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getCliques()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1173, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Result.getCliques');
      end
    end

    function varargout = getVariablesReeliminated(this, varargin)
      % GETVARIABLESREELIMINATED usage: getVariablesReeliminated() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getVariablesReeliminated()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1174, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Result.getVariablesReeliminated');
      end
    end

    function varargout = getVariablesRelinearized(this, varargin)
      % GETVARIABLESRELINEARIZED usage: getVariablesRelinearized() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % getVariablesRelinearized()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1175, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Result.getVariablesRelinearized');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string str) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string str)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1176, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Result.print');
      end
    end

  end

  methods(Static = true)
  end
end
