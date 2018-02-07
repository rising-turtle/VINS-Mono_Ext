%class GaussianConditional, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%GaussianConditional(size_t key, Vector d, Matrix R, Vector sigmas)
%GaussianConditional(size_t key, Vector d, Matrix R, size_t name1, Matrix S, Vector sigmas)
%GaussianConditional(size_t key, Vector d, Matrix R, size_t name1, Matrix S, size_t name2, Matrix T, Vector sigmas)
%
%-------Methods-------
%augmentedInformation() : returns Matrix
%dim() : returns size_t
%equals(GaussianConditional cg, double tol) : returns bool
%information() : returns Matrix
%print(string s) : returns void
%scaleFrontalsBySigma(VectorValues gy) : returns void
%solveInPlace(VectorValues x) : returns void
%solveTransposeInPlace(VectorValues gy) : returns void
%toFactor() : returns gtsam::JacobianFactor
%
classdef GaussianConditional < handle
  properties
    ptr_gtsamGaussianConditional = 0
  end
  methods
    function obj = GaussianConditional(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(592, my_ptr);
      elseif nargin == 4 && isa(varargin{1},'numeric') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double')
        my_ptr = gtsam_wrapper(593, varargin{1}, varargin{2}, varargin{3}, varargin{4});
      elseif nargin == 6 && isa(varargin{1},'numeric') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'numeric') && isa(varargin{5},'double') && isa(varargin{6},'double')
        my_ptr = gtsam_wrapper(594, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6});
      elseif nargin == 8 && isa(varargin{1},'numeric') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'numeric') && isa(varargin{5},'double') && isa(varargin{6},'numeric') && isa(varargin{7},'double') && isa(varargin{8},'double')
        my_ptr = gtsam_wrapper(595, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6}, varargin{7}, varargin{8});
      else
        error('Arguments do not match any overload of gtsam.GaussianConditional constructor');
      end
      obj.ptr_gtsamGaussianConditional = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(596, obj.ptr_gtsamGaussianConditional);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = augmentedInformation(this, varargin)
      % AUGMENTEDINFORMATION usage: augmentedInformation() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % augmentedInformation()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(597, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianConditional.augmentedInformation');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % dim()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(598, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianConditional.dim');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(GaussianConditional cg, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(GaussianConditional cg, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.GaussianConditional') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(599, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianConditional.equals');
      end
    end

    function varargout = information(this, varargin)
      % INFORMATION usage: information() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % information()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(600, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianConditional.information');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(601, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianConditional.print');
      end
    end

    function varargout = scaleFrontalsBySigma(this, varargin)
      % SCALEFRONTALSBYSIGMA usage: scaleFrontalsBySigma(VectorValues gy) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % scaleFrontalsBySigma(VectorValues gy)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        gtsam_wrapper(602, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianConditional.scaleFrontalsBySigma');
      end
    end

    function varargout = solveInPlace(this, varargin)
      % SOLVEINPLACE usage: solveInPlace(VectorValues x) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % solveInPlace(VectorValues x)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        gtsam_wrapper(603, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianConditional.solveInPlace');
      end
    end

    function varargout = solveTransposeInPlace(this, varargin)
      % SOLVETRANSPOSEINPLACE usage: solveTransposeInPlace(VectorValues gy) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % solveTransposeInPlace(VectorValues gy)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        gtsam_wrapper(604, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianConditional.solveTransposeInPlace');
      end
    end

    function varargout = toFactor(this, varargin)
      % TOFACTOR usage: toFactor() : returns gtsam::JacobianFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % toFactor()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(605, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianConditional.toFactor');
      end
    end

  end

  methods(Static = true)
  end
end
