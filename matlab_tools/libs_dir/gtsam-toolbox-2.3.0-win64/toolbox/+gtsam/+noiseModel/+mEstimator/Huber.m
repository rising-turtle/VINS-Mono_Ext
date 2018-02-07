%class Huber, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Huber(double k)
%
%-------Methods-------
%print(string s) : returns void
%
%-------Static Methods-------
%Create(double k) : returns gtsam::noiseModel::mEstimator::Huber
%
classdef Huber < gtsam.noiseModel.mEstimator.Base
  properties
    ptr_gtsamnoiseModelmEstimatorHuber = 0
  end
  methods
    function obj = Huber(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(541, varargin{2});
        end
        base_ptr = gtsam_wrapper(540, my_ptr);
      elseif nargin == 1 && isa(varargin{1},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(542, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.noiseModel.mEstimator.Huber constructor');
      end
      obj = obj@gtsam.noiseModel.mEstimator.Base(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamnoiseModelmEstimatorHuber = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(543, obj.ptr_gtsamnoiseModelmEstimatorHuber);
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
        gtsam_wrapper(544, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.mEstimator.Huber.print');
      end
    end

  end

  methods(Static = true)
    function varargout = Create(varargin)
      % CREATE usage: Create(double k) : returns gtsam::noiseModel::mEstimator::Huber
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % CREATE(double k)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(545, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.mEstimator.Huber.Create');
      end
    end

  end
end
