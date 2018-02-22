%class VectorValues, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%VectorValues()
%VectorValues(VectorValues other)
%VectorValues(size_t nVars, size_t varDim)
%
%-------Methods-------
%add(VectorValues c) : returns gtsam::VectorValues
%asVector() : returns Vector
%at(size_t j) : returns Vector
%dim(size_t j) : returns size_t
%dot(VectorValues V) : returns double
%equals(VectorValues expected, double tol) : returns bool
%exists(size_t j) : returns bool
%hasSameStructure(VectorValues other) : returns bool
%insert(size_t j, Vector value) : returns void
%norm() : returns double
%print(string s) : returns void
%resize(size_t nVars, size_t varDim) : returns void
%resizeLike(VectorValues other) : returns void
%scale(double a, VectorValues c) : returns gtsam::VectorValues
%setZero() : returns void
%size() : returns size_t
%
%-------Static Methods-------
%SameStructure(VectorValues other) : returns gtsam::VectorValues
%Zero(VectorValues model) : returns gtsam::VectorValues
%Zero(size_t nVars, size_t varDim) : returns gtsam::VectorValues
%
classdef VectorValues < handle
  properties
    ptr_gtsamVectorValues = 0
  end
  methods
    function obj = VectorValues(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(568, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(569);
      elseif nargin == 1 && isa(varargin{1},'gtsam.VectorValues')
        my_ptr = gtsam_wrapper(570, varargin{1});
      elseif nargin == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric')
        my_ptr = gtsam_wrapper(571, varargin{1}, varargin{2});
      else
        error('Arguments do not match any overload of gtsam.VectorValues constructor');
      end
      obj.ptr_gtsamVectorValues = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(572, obj.ptr_gtsamVectorValues);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = add(this, varargin)
      % ADD usage: add(VectorValues c) : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % add(VectorValues c)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(573, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VectorValues.add');
      end
    end

    function varargout = asVector(this, varargin)
      % ASVECTOR usage: asVector() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % asVector()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(574, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VectorValues.asVector');
      end
    end

    function varargout = at(this, varargin)
      % AT usage: at(size_t j) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % at(size_t j)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(575, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VectorValues.at');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim(size_t j) : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % dim(size_t j)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(576, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VectorValues.dim');
      end
    end

    function varargout = dot(this, varargin)
      % DOT usage: dot(VectorValues V) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % dot(VectorValues V)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(577, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VectorValues.dot');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(VectorValues expected, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(VectorValues expected, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.VectorValues') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(578, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VectorValues.equals');
      end
    end

    function varargout = exists(this, varargin)
      % EXISTS usage: exists(size_t j) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % exists(size_t j)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(579, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VectorValues.exists');
      end
    end

    function varargout = hasSameStructure(this, varargin)
      % HASSAMESTRUCTURE usage: hasSameStructure(VectorValues other) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % hasSameStructure(VectorValues other)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(580, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VectorValues.hasSameStructure');
      end
    end

    function varargout = insert(this, varargin)
      % INSERT usage: insert(size_t j, Vector value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % insert(size_t j, Vector value)
      if length(varargin) == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'double')
        gtsam_wrapper(581, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VectorValues.insert');
      end
    end

    function varargout = norm(this, varargin)
      % NORM usage: norm() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % norm()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(582, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VectorValues.norm');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(583, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VectorValues.print');
      end
    end

    function varargout = resize(this, varargin)
      % RESIZE usage: resize(size_t nVars, size_t varDim) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % resize(size_t nVars, size_t varDim)
      if length(varargin) == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric')
        gtsam_wrapper(584, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VectorValues.resize');
      end
    end

    function varargout = resizeLike(this, varargin)
      % RESIZELIKE usage: resizeLike(VectorValues other) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % resizeLike(VectorValues other)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        gtsam_wrapper(585, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VectorValues.resizeLike');
      end
    end

    function varargout = scale(this, varargin)
      % SCALE usage: scale(double a, VectorValues c) : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % scale(double a, VectorValues c)
      if length(varargin) == 2 && isa(varargin{1},'double') && isa(varargin{2},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(586, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VectorValues.scale');
      end
    end

    function varargout = setZero(this, varargin)
      % SETZERO usage: setZero() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setZero()
      if length(varargin) == 0
        gtsam_wrapper(587, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VectorValues.setZero');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(588, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VectorValues.size');
      end
    end

  end

  methods(Static = true)
    function varargout = SameStructure(varargin)
      % SAMESTRUCTURE usage: SameStructure(VectorValues other) : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % SAMESTRUCTURE(VectorValues other)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(589, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VectorValues.SameStructure');
      end
    end

    function varargout = Zero(varargin)
      % ZERO usage: Zero(VectorValues model),  Zero(size_t nVars, size_t varDim) : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % ZERO(VectorValues model)
      % ZERO(size_t nVars, size_t varDim)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(590, varargin{:});
      elseif length(varargin) == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric')
        varargout{1} = gtsam_wrapper(591, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VectorValues.Zero');
      end
    end

  end
end
