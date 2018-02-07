%class Diagonal, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Methods-------
%print(string s) : returns void
%
%-------Static Methods-------
%Precisions(Vector precisions) : returns gtsam::noiseModel::Diagonal
%Sigmas(Vector sigmas) : returns gtsam::noiseModel::Diagonal
%Variances(Vector variances) : returns gtsam::noiseModel::Diagonal
%
classdef Diagonal < gtsam.noiseModel.Gaussian
  properties
    ptr_gtsamnoiseModelDiagonal = 0
  end
  methods
    function obj = Diagonal(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(495, varargin{2});
        end
        base_ptr = gtsam_wrapper(494, my_ptr);
      else
        error('Arguments do not match any overload of gtsam.noiseModel.Diagonal constructor');
      end
      obj = obj@gtsam.noiseModel.Gaussian(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamnoiseModelDiagonal = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(496, obj.ptr_gtsamnoiseModelDiagonal);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(497, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.Diagonal.print');
      end
    end

  end

  methods(Static = true)
    function varargout = Precisions(varargin)
      % PRECISIONS usage: Precisions(Vector precisions) : returns gtsam::noiseModel::Diagonal
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % PRECISIONS(Vector precisions)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(498, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.Diagonal.Precisions');
      end
    end

    function varargout = Sigmas(varargin)
      % SIGMAS usage: Sigmas(Vector sigmas) : returns gtsam::noiseModel::Diagonal
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % SIGMAS(Vector sigmas)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(499, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.Diagonal.Sigmas');
      end
    end

    function varargout = Variances(varargin)
      % VARIANCES usage: Variances(Vector variances) : returns gtsam::noiseModel::Diagonal
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % VARIANCES(Vector variances)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(500, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.Diagonal.Variances');
      end
    end

  end
end
